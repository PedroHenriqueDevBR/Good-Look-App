import 'dart:convert';
import './customer_model.dart';

class Record {
  int? id;
  DateTime createAt;
  DateTime serviceDate;
  String? description;
  bool done;
  Customer customer;

  Record({
    this.id,
    required this.createAt,
    required this.serviceDate,
    this.description,
    this.done = false,
    required this.customer,
  });

  void doComplete() {
    this.done = true;
  }

  void undoComplete() {
    this.done = false;
  }

  void updateServiceDate(DateTime dateTime) {
    this.serviceDate = dateTime;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createAt': createAt.millisecondsSinceEpoch.toString(),
      'serviceDate': serviceDate.millisecondsSinceEpoch.toString(),
      'description': description,
      'done': done,
      'customer': customer.toMap(),
    };
  }

  factory Record.fromMap(Map<String, dynamic> map) {
    return Record(
      id: map['id'],
      createAt: DateTime.fromMillisecondsSinceEpoch(int.parse(map['createAt'])),
      serviceDate: DateTime.fromMillisecondsSinceEpoch(int.parse(map['serviceDate'])),
      description: map['description'],
      done: map['done'],
      customer: Customer.fromMap(map['customer']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Record.fromJson(String source) => Record.fromMap(json.decode(source));
}
