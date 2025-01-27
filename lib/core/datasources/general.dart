import 'package:jahzha_app/core/firebase_messaging_utils/firebase_messaging_utils.dart';
import 'package:jahzha_app/core/models/walkthrough.dart';

import '../models/app_banner.dart';
import '../network_utils/network_utils.dart';

class GeneralDatasource {
  Future<List<AppBanner>> getBanners() async {
    try {
      final response = await NetworkUtils.get(
        'home-slider',
      );
      final success = response.statusCode! < 300;
      if (success) {
        return (response.data['data'] as List).map((e) => AppBanner.fromJson(e)).toList();
      }
    } catch (e) {
      handleGenericException(e);
    }
    return [];
  }

  Future<List<Walkthrough>> getWalkthrough() async {
    try {
      final response = await NetworkUtils.get(
        'app-interface',
      );
      final success = response.statusCode! < 300;
      if (success) {
        return (response.data['data'] as List).map((e) => Walkthrough.fromJson(e)).toList();
      }
    } catch (e) {
      handleGenericException(e);
    }
    return [];
  }

  Future<void> sendFCMToken() async {
    try {
      await NetworkUtils.post(
        'create-device-token',
        data: {'device_token': await FirebaseMessagingUtils.instance.getFCM()},
      );
    } catch (e) {
      handleGenericException(e);
    }
  }
}