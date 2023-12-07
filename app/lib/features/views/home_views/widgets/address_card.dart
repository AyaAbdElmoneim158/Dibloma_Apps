import 'package:flutter/material.dart';
import 'package:todo_app/core/shareable_components/common_card.dart';
import 'package:todo_app/core/utils/helper.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Helper.showCheckoutCardTextName(text: "John Doe, +961-1"),
          Helper.showCheckoutCardTextName(text: "Schools Street"),
          Helper.showCheckoutCardTextName(text: "Maghdaouche"),
        ],
      ),
    );
  }
}
