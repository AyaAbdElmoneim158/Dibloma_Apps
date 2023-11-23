import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/wish/widgets/wish_list.dart';
import 'package:todo_app/features/wish/widgets/wish_search_box.dart';

class WishScreen extends StatelessWidget {
  const WishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WishList"),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const WishSearchBox(),
            Helper.hSizeBox(32),
            const WishList(),
          ],
        ),
      ),
    );
  }
}
