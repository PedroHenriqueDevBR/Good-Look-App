import 'package:flutter_test/flutter_test.dart';
import 'package:personal_service_manager/src/shared/models/customer_model.dart';

void main() {
  late Customer customer;

  setUpAll(() {
    customer = Customer(name: 'Cliente 01');
  });

  test('O nome do cliente deve ser Cliente 01', () {
    expect(customer.name, equals('Cliente 01'));
  });
}
