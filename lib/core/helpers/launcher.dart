import 'package:url_launcher/url_launcher.dart';

abstract class Launcher {
  static const LaunchMode _launchMode = LaunchMode.externalApplication;

  static Future<void> openEmail(String email) async {
    await launchUrl(
      Uri.parse('mailto:$email'),
      mode: _launchMode,
    );
  }

  static Future<void> openPhone(String phone) async {
    await launchUrl(
      Uri.parse('tel:$phone'),
      mode: _launchMode,
    );
  }

  static Future<void> openUrl(String url) async {
    await launchUrl(
      Uri.parse(url),
      mode: _launchMode,
    );
  }

  static Future<void> openGoogleMaps({
    required String latitude,
    required String longitude,
  }) async {
    await launchUrl(
      Uri.parse(
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude'),
      mode: _launchMode,
    );
  }

  static Future<void> openWhatsApp(String phone) {
    return launchUrl(
      Uri.parse('https://wa.me/${phone}'),
      mode: _launchMode,
    );
  }
}
