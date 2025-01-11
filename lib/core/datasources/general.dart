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
}