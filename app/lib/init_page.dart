import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:todo_app/core/model/product_model.dart';
import 'package:todo_app/core/model/profile_model.dart';
import 'package:todo_app/core/shareable_components/common_field.dart';
import 'package:todo_app/core/shareable_components/common_circle_avatar.dart';
import 'package:todo_app/core/shareable_components/common_product_h_card.dart';
import 'package:todo_app/core/shareable_components/common_product_v_card.dart';
import 'package:todo_app/core/shareable_components/common_profile_card.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Text(
                "Store App",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Image.asset('assets/images/Woman Shopping.gif'),*/
              //!---------------------------------
              // const CommonButton(buttonText: 'Login'),
              // CommonCategoryCard(category: categories[2]),
              // CommonCircleAvatar(
              //   avatar: Svg
              // ),
              /* CommonCircleAvatar(
                radius: 32,
                avatar: Icon(
                  IconlyBroken.notification,
                  color: AppColors.primaryColor,
                ),
              ),
              CommonField(
                hintText: 'Search here....',
                prefixIcon: Icon(
                  IconlyBroken.search,
                  color: AppColors.primaryColor,
                ),
              ),*/
              // CommonProductHCard(product: products[1]),
              // CommonProfileCard(model: profileCards[1]),
              CommonProductVCard(product: products[1]),
            ],
          ),
        ),
      ),
    );
  }
}
