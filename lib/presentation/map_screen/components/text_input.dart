import 'package:check_weather/utils/debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class TextInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  const TextInput({super.key, required this.controller, required this.label});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  Iterable<String> _lastOptions = [];
  late Debounceable<Iterable<String>?, String> _debounceableSearch;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _debounceableSearch = debounce(1000, _searchAddress);
  }

  Future<Iterable<String>> _searchAddress(String text) async {
    List<SearchInfo> addresses = await addressSuggestion(text);

    return addresses.map((e) {
      return List.from([e.address?.name, e.address?.state, e.address?.country])
          .whereType<String>()
          .join(",");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete(
      fieldViewBuilder: (BuildContext context, TextEditingController controller,
          FocusNode focusNode, VoidCallback onFieldSubmitted) {
        return TextFormField(
          decoration: InputDecoration(
              label: Text(widget.label),
              filled: true,
              fillColor: const Color.fromRGBO(255, 255, 255, 0.5)),
          controller: controller,
          focusNode: focusNode,
          onFieldSubmitted: (String value) {
            onFieldSubmitted();
          },
        );
      },
      optionsBuilder: (textEditingValue) async {
        final Iterable<String>? options =
            await _debounceableSearch(textEditingValue.text);
        if (options == null) {
          return _lastOptions;
        }
        _lastOptions = options;

        return options;
      },
      onSelected: (String address) {
        widget.controller.text = address;
      },
    );
  }
}
