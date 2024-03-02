import 'routes.dart';

class RouteDirectionsModel {
  List<Routes> routes = [];

  RouteDirectionsModel({required this.routes});

  factory RouteDirectionsModel.fromJSON(Map<String, dynamic> json) {
    return RouteDirectionsModel(
        routes: List<Routes>.from(
            json['routes'].map((route) => Routes.fromJSON(route))));
  }
}
