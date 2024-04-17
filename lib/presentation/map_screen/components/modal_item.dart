import 'package:flutter/material.dart';

class ModalItem extends StatelessWidget {
  final String title;
  final String value;
  final Color textColor;
  final String? unit;

  const ModalItem(
      {super.key,
      required this.title,
      required this.value,
      this.unit = "",
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(color: textColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(color: textColor),
            ),
            Container(
              width: 12,
            ),
            Text(
              unit!,
              style: TextStyle(color: textColor),
            )
          ],
        )
      ],
    );
  }
}
