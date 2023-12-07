import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '/core/utils/helper.dart';
import '/features/views/profile_views/widgets/build_profile_image_dialog.dart';

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
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomRight,
          children: [
            const CircleAvatar(
              radius: 64,
              backgroundImage: AssetImage(
                'assets/images/earphones.jpg',
              ),
            ),
            IconButton.outlined(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const ProfileImageDialog(),
                );
              },
              icon: const Icon(IconlyLight.camera),
            ),
          ],
        ),
        Helper.hSizeBox(12),
        Helper.showUserName(userName: email),
      ],
    );
  }
}
