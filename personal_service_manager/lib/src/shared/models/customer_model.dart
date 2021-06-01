import 'dart:convert';

class Customer {
  int? id;
  String name;
  String? phone;
  String? email;
  String? homeAddress;
  String? observations;

  Customer({
    this.id,
    required this.name,
    this.phone,
    this.email,
    this.homeAddress,
    this.observations,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'homeAddress': homeAddress,
      'observations': observations,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      homeAddress: map['homeAddress'],
      observations: map['observations'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source));
}
