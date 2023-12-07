import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/core/utils/helper.dart';
import '/features/providers/main_provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, mainProvider, child) =>
          Helper.buildBottomNavigationBar(
        items: mainProvider.items(),
        onTap: (value) => mainProvider.onSelected(value),
        currentIndex: mainProvider.currentPage,
      ),
    );
  }
}
