import 'package:check_weather/di/service.dart';
import 'package:check_weather/domain/entity/travel_weather_entity.dart';
import 'package:check_weather/domain/repository/request/position_repository_request.dart';
import 'package:check_weather/domain/use_case/get_address.dart';
import 'package:check_weather/domain/use_case/get_travel_weathers.dart';
import 'package:check_weather/presentation/map_screen/components/marker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapScreenController {
  GetAddressUseCase getAddressUseCase = getIt<GetAddressUseCase>();
  GetTravelWeathersUseCase getTravelWeathersUseCase =
      getIt<GetTravelWeathersUseCase>();

  MapController mapController = MapController(
    initMapWithUserPosition:
        const UserTrackingOption(unFollowUser: true, enableTracking: false),
  );

  ValueListenable<bool> buttonLoading = ValueNotifier(false);
  TextEditingController initTextController = TextEditingController();
  TextEditingController endTextController = TextEditingController();

  void getWeatherByCities() async {
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

    var geopoints = await mapController.geopoints;

    await mapController.clearAllRoads();
    await mapController.removeMarkers(geopoints);

    for (var element in travelWeathers) {
      await mapController.addMarker(
          GeoPoint(
              latitude: element.position.latitude,
              longitude: element.position.longitude),
          markerIcon: MarkerIcon(
            iconWidget: Marker(
              travelWeatherEntity: element,
            ),
          ));
    }

    for (var i = 0; i < travelWeathers.length - 1; i++) {
      var previousPosition = GeoPoint(
          latitude: travelWeathers[i].position.latitude,
          longitude: travelWeathers[i].position.longitude);
      var nextPosition = GeoPoint(
          latitude: travelWeathers[i + 1].position.latitude,
          longitude: travelWeathers[i + 1].position.longitude);

      await mapController.drawRoad(previousPosition, nextPosition,
          roadOption:
              const RoadOption(roadColor: Colors.black, zoomInto: false));
    }

    buttonLoading = ValueNotifier(false);
  }
}
