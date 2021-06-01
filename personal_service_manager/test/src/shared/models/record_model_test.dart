import 'package:flutter_test/flutter_test.dart';
import 'package:personal_service_manager/src/shared/models/customer_model.dart';
import 'package:personal_service_manager/src/shared/models/record_model.dart';

void main() {
  late Record record;

  setUpAll(() {
    Customer customer = Customer(name: 'Cliente 01');

    record = Record(
      createAt: DateTime.now(),
      serviceDate: DateTime.utc(2021, 6, 8, 00, 00, 00),
      customer: customer,
    );
  });

  test('O nome do cliente deve ser Cliente 01', () {
    expect(record.customer.name, equals('Cliente 01'));
  });

  test('O ID do cliente deve ser nulo', () {
    expect(record.customer.id, equals(null));
  });
}
