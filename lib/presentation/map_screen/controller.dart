import 'package:check_weather/di/service.dart';
import 'package:check_weather/domain/entity/travel_weather_entity.dart';
import 'package:check_weather/domain/repository/request/position_repository_request.dart';
import 'package:check_weather/domain/use_case/get_address.dart';
import 'package:check_weather/domain/use_case/get_travel_weathers.dart';
import 'package:check_weather/presentation/map_screen/components/custom_marker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart' as locator;
import 'package:latlong2/latlong.dart';

class MapScreenController {
  GetAddressUseCase getAddressUseCase = getIt<GetAddressUseCase>();
  GetTravelWeathersUseCase getTravelWeathersUseCase =
      getIt<GetTravelWeathersUseCase>();

  final mapController = MapController();
  locator.Position? userPosition;
  List<Marker> markers = [];

  ValueListenable<bool> buttonLoading = ValueNotifier(false);
  TextEditingController initTextController = TextEditingController();
  TextEditingController endTextController = TextEditingController();

  Future<bool> _getUserPermissions() async {
    do {
      var locatorPermission = await locator.Geolocator.checkPermission();
      if (locatorPermission == locator.LocationPermission.denied) {
        await locator.Geolocator.requestPermission();
        continue;
      }
      if (locatorPermission == locator.LocationPermission.deniedForever) {
        return false;
      }
      if (locatorPermission == locator.LocationPermission.always) {
        return true;
      }
      if (locatorPermission == locator.LocationPermission.whileInUse) {
        return true;
      }
      if (locatorPermission == locator.LocationPermission.unableToDetermine) {
        return false;
      }

      return false;
    } while (true);
  }

  void onMapRendered() async {
    var canGetUserPosition = await _getUserPermissions();
    if (!canGetUserPosition) return;

    userPosition = await locator.Geolocator.getCurrentPosition();
    if (userPosition?.longitude != null && userPosition?.longitude != null) {
      mapController.move(
          LatLng(userPosition!.latitude, userPosition!.longitude), 15);
    }
  }

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
