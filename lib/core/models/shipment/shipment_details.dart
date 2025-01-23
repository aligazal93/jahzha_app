import 'package:collection/collection.dart';

class ShipmentDetails {
  final int id;
  final _Person shipper;
  final _Person receiver;
  final _Shipment shipment;
  final List<_File> files;
  final String careemTrackingURL;
  final List<_TrackingStep> trackingSteps;

  ShipmentDetails({
    required this.id,
    required this.shipper,
    required this.receiver,
    required this.shipment,
    required this.files,
    required this.careemTrackingURL,
    required this.trackingSteps,
  });

  factory ShipmentDetails.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    final additional = json['additional_data'] ?? {};
    return ShipmentDetails(
      id: data['id'],
      shipper: _Person.fromJson(data['shipper_details']),
      receiver: _Person.fromJson(data['receiver_details']),
      shipment: _Shipment.fromJson(data['shipment_details']),
      files: (data['shipment_files'] as List).map((e) => _File.fromJson(e)).toList(),
      careemTrackingURL: additional['careem_track_url'],
      trackingSteps: ((additional['tracking_response'] ?? []) as List)
          .map((e) => _TrackingStep.fromJson(e))
          .toList(),
    );
  }
}

class _Person {
  final String name;
  final String phone;
  final String address;

  _Person({
    required this.name,
    required this.phone,
    required this.address,
  });

  factory _Person.fromJson(Map<String, dynamic> json) {
    return _Person(
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
    );
  }
}

class _Shipment {
  final String weight;
  final String shippingPrice;
  final String expectedArrivalText;
  final String trackNumber;
  final String paymentTransactionID;
  final String createdAt;

  _Shipment({
    required this.weight,
    required this.shippingPrice,
    required this.expectedArrivalText,
    required this.trackNumber,
    required this.paymentTransactionID,
    required this.createdAt,
  });

  factory _Shipment.fromJson(Map<String, dynamic> json) {
    return _Shipment(
      weight: json['weight'].toString(),
      shippingPrice: json['shipping_price'],
      expectedArrivalText: json['expected_arrival_text'],
      trackNumber: json['track_number'],
      paymentTransactionID: json['payment_transaction_id'],
      createdAt: json['created_at'],
    );
  }
}

class _File {
  final String type;
  final String url;

  _File({
    required this.type,
    required this.url,
  });

  factory _File.fromJson(Map<String, dynamic> json) {
    return _File(
      type: json['type'],
      url: json['print_url'],
    );
  }
}

class _TrackingStep {
  final bool active;
  final TrackingStatus? status;
  final String statusText;
  final String time;

  _TrackingStep({
    required this.active,
    required this.status,
    required this.statusText,
    required this.time,
  });

  factory _TrackingStep.fromJson(Map<String, dynamic> json) {
    return _TrackingStep(
      active: json['active'],
      status: TrackingStatus.values.firstWhereOrNull(
        (e) => json['status'] == e.name,
      ),
      statusText: json['status_text'],
      time: json['timing'],
    );
  }
}

enum TrackingStatus {
  Pending,
  Processing,
  Picked,
  Cancelled,
  Delivered,
}

/*


{
    "additional_data": {
        "tracking_response": [
            {
                "active": true,
                "status": "Cancelled",
                "status_text": "تم إلغاء شحنتك.",
                "timing": "November 21, 2024, 1:58 pm"
            },
            {
                "active": false,
                "status": "Processing",
                "status_text": "جاري المعالجة...",
                "timing": "November 20, 2024, 7:32 pm"
            }
        ],
        "careem_track_url": ""
    }
}
 */
