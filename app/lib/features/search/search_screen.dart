import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/search/widgets/search_header_with_filter.dart';
import 'package:todo_app/features/search/widgets/searched_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SearchHeaderWithFilter(),
            Helper.hSizeBox(32),
            const SearchedList(),
          ],
        ),
      ),
    );
  }
}
