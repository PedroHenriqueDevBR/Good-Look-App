import 'package:flutter_test/flutter_test.dart';
import 'package:personal_service_manager/src/shared/models/service_model.dart';

void main() {
  late Service service;

  setUpAll(() {
    service = Service(
      name: 'Corte de cabelo',
      description: 'Corte de cabelo masculino',
      cost: 10.0,
    );
  });

  test('O nome do serviço deve ser "Corte de cabelo"', () {
    expect(service.name, equals('Corte de cabelo'));
  });
}
