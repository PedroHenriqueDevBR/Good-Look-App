import 'package:flutter_test/flutter_test.dart';
import 'package:personal_service_manager/src/shared/models/customer_model.dart';
import 'package:personal_service_manager/src/shared/models/record_model.dart';
import 'package:personal_service_manager/src/shared/models/service_model.dart';
import 'package:personal_service_manager/src/shared/models/service_offered_mode.dart';

void main() {
  late ServiceOffered serviceOffered;

  setUpAll(() {
    Customer customer = Customer(name: 'Cliente 01');
    Record record = Record(
      createAt: DateTime.now(),
      serviceDate: DateTime.now(),
      customer: customer,
    );
    Service service = Service(
      name: 'name',
      description: 'description',
      cost: 10.0,
    );
    serviceOffered = ServiceOffered(
      amountPaid: 10,
      record: record,
      service: service,
    );
  });

  test('O valor pago de service offered deve ser de "10.0"', () {
    expect(serviceOffered.amountPaid, equals(10.0));
  });
}
