import 'package:flutter/material.dart';
import 'package:google_places_flutter/model/prediction.dart';

class GetOffersDTO {
  GetOffersDTO();

  final weightTXController = TextEditingController();
  final originTXController = TextEditingController();
  final destinationTXController = TextEditingController();
  final destinationCountryTXController = TextEditingController();
  Prediction? origin;
  Prediction? destination;
  Prediction? destinationCountry;
  bool? filterPriceInDescendingOrder;
  bool? orderByFastest;
  bool? orderByNewest;

  bool get isFilterApplied {
    return orderByNewest != null ||
        orderByFastest != null ||
        filterPriceInDescendingOrder != null;
  }

  Map<String, dynamic> toJson({required bool isLocal}) {
    final additions = <String, dynamic>{
      if (filterPriceInDescendingOrder != null)
        "filter_price": filterPriceInDescendingOrder! ? "DES" : "ASC",
      if (orderByFastest != null)
        "order_by_fastest": orderByFastest! ? "1" : "0",
      if (orderByNewest != null) "order_by_newest": orderByNewest! ? "1" : "0",
    };
    if (isLocal) {
      return {
        "domestic_origin_city": origin!.city,
        "domestic_origin_lat": origin!.lat,
        "domestic_origin_lng": origin!.lng,
        "domestic_origin_region_name": origin!.region,
        "domestic_destination_city": destination!.city,
        "domestic_destination_region_name": destination!.region,
        "domestic_destination_lat": destination!.lat,
        "domestic_destination_lng": destination!.lng,
        "weight": weightTXController.text,
        ...additions,
      };
    }
    return {
      "international_origin_city": origin!.city,
      "international_origin_lat": origin!.lat,
      "international_origin_lng": origin!.lng,
      "international_origin_region_name": origin!.region,
      "international_destination_country_code": destination!.countryCode,
      "international_destination_city": destination!.city,
      "international_destination_lat": destination!.lat,
      "international_destination_lng": destination!.lng,
      "weight": weightTXController.text,
      ...additions,
    };
  }

  void dispose() {
    weightTXController.dispose();
    originTXController.dispose();
    destinationTXController.dispose();
  }
}
