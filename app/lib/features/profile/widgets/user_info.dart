import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/helper.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 64,
          backgroundImage: AssetImage(
            'assets/images/earphones.jpg',
          ),
        ),
        Helper.hSizeBox(12),
        Helper.showProductDescription(
          context: context,
          productDescription: 'John Doe',
        ),
      ],
    );
  }
}
