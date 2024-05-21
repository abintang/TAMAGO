import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class LaunchStreamsApp {
  Future<void> launchAnotherApp(String? url) async {
    if (url == null || url.isEmpty) {
      throw 'URL is null or empty';
    }

    final Uri uri = Uri.parse('https://$url');

    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      log('Error launching URL: $e');
    }
  }
}
