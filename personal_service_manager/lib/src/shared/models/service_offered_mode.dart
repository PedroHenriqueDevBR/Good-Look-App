import 'dart:convert';

import './record_model.dart';
import './service_model.dart';

class ServiceOffered {
  int? id;
  double amountPaid;
  Record record;
  Service service;

  ServiceOffered({
    this.id,
    required this.amountPaid,
    required this.record,
    required this.service,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amountPaid': amountPaid,
      'record': record.toMap(),
      'service': service.toMap(),
    };
  }

  factory ServiceOffered.fromMap(Map<String, dynamic> map) {
    return ServiceOffered(
      id: map['id'],
      amountPaid: map['amountPaid'],
      record: Record.fromMap(map['record']),
      service: Service.fromMap(map['service']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceOffered.fromJson(String source) => ServiceOffered.fromMap(json.decode(source));
}
