import 'package:flutter/material.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';
import '/features/views/home_views/widgets/best_selling_list.dart';
import '/features/views/home_views/widgets/feature_list.dart';
import '/features/views/home_views/widgets/search_header.dart';
import '/features/views/home_views/widgets/special_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppConst.globalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SearchHeader(),
                Helper.showHeaderList(
                  header: AppStrings.specialForYou,
                ),
                const SpecialList(),
                Helper.showHeaderList(
                  header: AppStrings.featuredProduct,
                ),
                const FeaturedList(),
                Helper.showHeaderList(
                  header: AppStrings.bestSellingProduct,
                ),
                const BestSellingList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
