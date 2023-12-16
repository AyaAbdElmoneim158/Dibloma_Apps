import 'package:flutter/material.dart';
import '/core/utils/helper.dart';

class ImagesList extends StatelessWidget {
  const ImagesList({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Helper.wSizeBox(8),
      separatorBuilder: (context, index) => CircleAvatar(
        radius: 22,
        backgroundImage: NetworkImage(images[0]),
      ),
      itemCount: images.length,
    );
  }
}
