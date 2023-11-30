import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/model/language_model.dart';
import 'package:todo_app/core/shareable_components/common_card.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({super.key, required this.language});
  final LanguageModel language;
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      child: Row(
        children: [
          CountryFlag.fromLanguageCode(
            language.languageCode,
            width: 50,
            height: 50,
            borderRadius: AppConst.globalRadius,
          ),
          Helper.wSizeBox(AppConst.globalSizeBox),
          Helper.showLangText(
            text: language.name,
          ),
        ],
      ),
    );
  }
}
