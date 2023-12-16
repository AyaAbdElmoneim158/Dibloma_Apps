import 'package:flutter/material.dart';
import '/core/utils/helper.dart';

class ColorsList extends StatelessWidget {
  const ColorsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(radius: 22, backgroundColor: Colors.red),
        Helper.wSizeBox(8),
        const CircleAvatar(radius: 22, backgroundColor: Colors.black),
        Helper.wSizeBox(8),
        const CircleAvatar(radius: 22, backgroundColor: Colors.blue),
      ],
    );
  }
}
