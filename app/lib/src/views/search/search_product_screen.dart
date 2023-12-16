import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/src/views/search/widgets/search_header_with_filter.dart';
import 'package:todo_app/src/views/search/widgets/searched_list.dart';

class SearchProductScreen extends StatelessWidget {
  const SearchProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppConst.globalPadding),
        child: Column(
          children: [
            const SearchHeaderWithFilter(),
            Helper.hSizeBox(AppConst.globalPadding),
            const SearchedList(),
          ],
        ),
      ),
    );
  }
}
