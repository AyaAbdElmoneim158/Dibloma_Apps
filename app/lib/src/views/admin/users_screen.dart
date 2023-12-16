import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:todo_app/core/shareable_components/common_circle_avatar.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/src/model/user_model.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
            title: Text(UserModel.dummyUsers[index].name!),
            subtitle: Text(
              UserModel.dummyUsers[index].email!,
            ),
            trailing: Row(
              children: [
                CommonCircleAvatar(
                  avatar: const Icon(IconlyBold.edit),
                  onTap: () {},
                ),
                Helper.hSizeBox(AppConst.globalSizeBox),
                CommonCircleAvatar(
                  avatar: const Icon(IconlyBold.delete),
                  onTap: () {},
                ),
              ],
            )),
        separatorBuilder: (context, index) =>
            Helper.hSizeBox(AppConst.globalSizeBox),
        itemCount: UserModel.dummyUsers.length,
      ),
    );
  }
}
