import 'dart:convert';

import 'package:check_weather/infra/data/model/search_address/search_address.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/search_address_mock.dart';

void main() {
  test('should return the the data parsed in the model', () {
    SearchAddressModel model =
        SearchAddressModel.fromJSON(jsonDecode(searchAddressMock));

    expect(model.results[0].viewport.btmRightPoint.lat, -23.55801);
    expect(model.results[0].viewport.btmRightPoint.lon, -51.83583);
    expect(model.results[0].viewport.topLeftPoint.lat, -23.25371);
    expect(model.results[0].viewport.topLeftPoint.lon, -52.1012);
    expect(model.results[0].position.lat, -23.42732);
    expect(model.results[0].position.lon, -51.93696);
  });
}
