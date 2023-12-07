import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/features/providers/main_provider.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, mainProvider, child) => PageView(
        controller: mainProvider.controller,
        onPageChanged: (value) => mainProvider.onPageChanged(value),
        physics: const BouncingScrollPhysics(),
        children: mainProvider.screens,
      ),
    );
  }
}
