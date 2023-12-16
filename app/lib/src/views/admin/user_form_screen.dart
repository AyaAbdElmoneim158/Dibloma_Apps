import 'package:flutter/material.dart';
import 'package:todo_app/core/shareable_components/common_button.dart';
import 'package:todo_app/core/utils/helper.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({super.key});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  String role = "Customer";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(hintText: 'Name'),
              ),
              Helper.hSizeBox(8),
              const TextField(
                decoration: InputDecoration(hintText: 'Email'),
              ),
              Helper.hSizeBox(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Role"),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(child: Text("Customer")),
                      DropdownMenuItem(child: Text("Admin")),
                    ],
                    onChanged: (val) {
                      setState(() {
                        role = val;
                      });
                    },
                  ),
                ],
              ),
              Helper.hSizeBox(24),
              const CommonButton(
                buttonText: "Add User",
              )
            ],
          ),
        ),
      ),
    );
  }
}
