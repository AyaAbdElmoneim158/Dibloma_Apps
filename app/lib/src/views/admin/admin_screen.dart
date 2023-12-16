import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/asset_manager.dart';
import 'package:todo_app/src/views/admin/widgets/admin_card.dart';

class Admin extends StatefulWidget {
  static const routeName = '/Admin';
  const Admin({super.key});

  @override
  State<Admin> createState() => AdminState();
}

class AdminState extends State<Admin> {
  List<Map<String, dynamic>> adminCards = [
    {"text": "Users", "imagePath": ImageAssets.user, "onPressed": () {}},
    {
      "text": "Categories",
      "imagePath": ImageAssets.category1Image,
      "onPressed": () {}
    },
    {
      "text": "Products",
      "imagePath": ImageAssets.product1Image,
      "onPressed": () {}
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        adminCards.length,
        (index) => AdminCard(
          text: adminCards[index]['text'],
          imagePath: adminCards[index]['imagePath'],
          onPressed: adminCards[index]['onPressed'],
        ),
      ),
    ));
  }
}
