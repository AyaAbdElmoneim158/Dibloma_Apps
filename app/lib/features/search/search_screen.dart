import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/search/widgets/search_header_with_filter.dart';
import 'package:todo_app/features/search/widgets/searched_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.buildAppBar(title: AppStrings.searchProduct),
      body: Padding(
        padding: const EdgeInsets.all(AppConst.globalPadding),
        child: Column(
          children: [
            const SearchHeaderWithFilter(),
            Helper.hSizeBox(AppConst.globalSizeBox * 4),
            const SearchedList(),
          ],
        ),
      ),
    );
  }
}
