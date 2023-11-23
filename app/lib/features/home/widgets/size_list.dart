import 'package:flutter/material.dart';

class SizesList extends StatelessWidget {
  const SizesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          shape:
              ContinuousRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('13"'),
          ),
        ),
        Card(
          shape:
              ContinuousRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('14"'),
          ),
        ),
        Card(
          shape:
              ContinuousRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('15"'),
          ),
        ),
        Card(
          shape:
              ContinuousRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('16"'),
          ),
        ),
      ],
    );
  }
}
