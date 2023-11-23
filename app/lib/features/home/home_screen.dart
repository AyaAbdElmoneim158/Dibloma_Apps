import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/home/widgets/best_selling_list.dart';
import 'package:todo_app/features/home/widgets/feature_list.dart';
import 'package:todo_app/features/home/widgets/search_header.dart';
import 'package:todo_app/features/home/widgets/special_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SearchHeader(),
                Helper.hSizeBox(32),
                Helper.showHeaderWithSeeMore(header: AppStrings.specialForYou),
                Helper.hSizeBox(18),
                const SpecialList(),
                Helper.hSizeBox(18),
                Helper.showHeaderWithSeeMore(
                    header: AppStrings.featuredProduct),
                Helper.hSizeBox(18),
                const FeaturedList(),
                Helper.hSizeBox(18),
                Helper.showHeaderWithSeeMore(
                    header: AppStrings.bestSellingProduct),
                Helper.hSizeBox(18),
                const BestSellingList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
