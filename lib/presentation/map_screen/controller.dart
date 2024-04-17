import 'package:check_weather/di/service.dart';
import 'package:check_weather/domain/entity/travel_weather_entity.dart';
import 'package:check_weather/domain/repository/request/position_repository_request.dart';
import 'package:check_weather/domain/use_case/get_address.dart';
import 'package:check_weather/domain/use_case/get_travel_weathers.dart';
import 'package:check_weather/presentation/map_screen/components/custom_marker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreenController {
  GetAddressUseCase getAddressUseCase = getIt<GetAddressUseCase>();
  GetTravelWeathersUseCase getTravelWeathersUseCase =
      getIt<GetTravelWeathersUseCase>();

  final mapController = MapController();
  List<Marker> markers = [];

  ValueListenable<bool> buttonLoading = ValueNotifier(false);
  TextEditingController initTextController = TextEditingController();
  TextEditingController endTextController = TextEditingController();

  void getWeatherByCities() async {
    markers.clear();
    buttonLoading = ValueNotifier(true);
    String initText = initTextController.text;
    String endText = endTextController.text;

    if (initText == '' || endText == '') {
      return;
    }

    GetAddressUseCaseParams params =
        GetAddressUseCaseParams(initialCity: initText, finalCity: endText);

    AddressMap cities = await getAddressUseCase.call(params);

    GetPositionsRequest positionsRequest = GetPositionsRequest(
        startPosition: Position(
            lat: cities.initialCity.position.lat,
            lon: cities.initialCity.position.lon),
        endPosition: Position(
            lat: cities.finalCity.position.lat,
            lon: cities.finalCity.position.lon));

    List<TravelWeatherEntity> travelWeathers =
        await getTravelWeathersUseCase.call(positionsRequest);

    mapController.fitBounds(LatLngBounds(
        LatLng(travelWeathers.first.position.latitude,
            travelWeathers.first.position.longitude),
        LatLng(travelWeathers.last.position.latitude,
            travelWeathers.last.position.longitude)));
    for (var element in travelWeathers) {
      markers.add(Marker(
          point: LatLng(element.position.latitude, element.position.longitude),
          height: 80,
          width: 80,
          builder: (ctx) {
            return CustomMarker(
              travelWeatherEntity: element,
            );
          }));
    }

    buttonLoading = ValueNotifier(false);
  }
}
