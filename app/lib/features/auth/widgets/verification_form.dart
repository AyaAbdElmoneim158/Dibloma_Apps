import 'package:flutter/material.dart';
import 'package:todo_app/core/shareable_components/common_button.dart';
import 'package:todo_app/core/shareable_components/common_field.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/core/utils/styles.dart';

class VerificationForm extends StatelessWidget {
  const VerificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController? controller = TextEditingController();

    return Column(
      children: [
        Row(
          children: [
            const Expanded(flex: 2, child: SizedBox()),
            Expanded(
              flex: 2,
              child: CommonField(
                hintText: '-',
                keyboardType: TextInputType.number,
                controller: controller,
                textAlign: TextAlign.center,
                validator: (val) {
                  return null;
                },
              ),
            ),
            Helper.wSizeBox(8),
            Expanded(
              flex: 2,
              child: CommonField(
                hintText: '-',
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                controller: controller,
                validator: (val) {
                  return null;
                },
              ),
            ),
            Helper.wSizeBox(8),
            Expanded(
              flex: 2,
              child: CommonField(
                hintText: '-',
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                controller: controller,
                validator: (val) {
                  return null;
                },
              ),
            ),
            Helper.wSizeBox(8),
            Expanded(
              flex: 2,
              child: CommonField(
                hintText: '-',
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                controller: controller,
                validator: (val) {
                  return null;
                },
              ),
            ),
            Helper.wSizeBox(8),
            const Expanded(flex: 2, child: SizedBox()),
          ],
        ),
        Helper.hSizeBox(18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.notGetCode,
              style: Styles.getHeaderDescriptionTextStyle(),
            ),
            Text(
              AppStrings.sendAgain,
              style:
                  Styles.getHeaderDescriptionTextStyle(AppColors.primaryColor),
            ),
          ],
        ),
        Helper.hSizeBox(132),
        CommonButton(
          buttonText: AppStrings.verification,
          radius: 4,
          onTap: () {},
        ),
      ],
    );
  }
}
