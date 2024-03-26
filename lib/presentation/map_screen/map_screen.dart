import 'package:check_weather/presentation/map_screen/components/text_input.dart';
import 'package:check_weather/presentation/map_screen/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapScreenController controller = MapScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OSMFlutter(
            controller: controller.mapController,
            osmOption: const OSMOption(),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 64, left: 24, right: 24, bottom: 24),
            child: Column(
              children: [
                TextInput(
                  controller: controller.initTextController,
                  label: "Cidade Inicial",
                ),
                Container(
                  height: 20,
                ),
                TextInput(
                  controller: controller.endTextController,
                  label: "Cidade Final",
                ),
                const Spacer(
                  flex: 1,
                ),
                ValueListenableBuilder(
                    valueListenable: controller.buttonLoading,
                    builder: (context, value, child) {
                      return ElevatedButton(
                          onPressed: controller.getWeatherByCities,
                          child: value == true
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ))
                              : const Text("Calcular"));
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
