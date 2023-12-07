import 'package:flutter/material.dart';
import '/features/model/language_model.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';
import '/features/views/profile_views/widgets/language_card.dart';

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
