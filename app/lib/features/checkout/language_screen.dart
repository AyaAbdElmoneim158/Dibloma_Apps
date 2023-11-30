import 'package:flutter/material.dart';
import 'package:todo_app/core/shareable_components/common_card.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:country_flags/country_flags.dart';
import 'package:todo_app/features/checkout/widgets/language_card.dart';
import '../../core/model/language_model.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.buildAppBar(title: AppStrings.language),
      body: Column(
        children: [
          Helper.buildBottomTextAppBar(
            bottomText: AppStrings.selectLanguage,
          ),
          Helper.hSizeBox(AppConst.globalSizeBox * 3),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => LanguageCard(
                  language: LanguageModel.dummyLanguageList[index]),
              separatorBuilder: (context, index) =>
                  Helper.hSizeBox(AppConst.globalSizeBox * 4),
              itemCount: LanguageModel.dummyLanguageList.length,
            ),
          ),
        ],
      ),
    );
  }
}
