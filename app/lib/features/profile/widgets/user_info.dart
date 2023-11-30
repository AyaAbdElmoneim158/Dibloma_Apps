import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/helper.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.email,
  });

  final String email;

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
        Helper.showUserName(userName: email),
      ],
    );
  }
}
