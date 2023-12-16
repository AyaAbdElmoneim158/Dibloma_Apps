import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/controller/app_cubit/app_cubit.dart';
import '/core/utils/helper.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      var appCubit = AppCubit.get(context);

      return Helper.buildBottomNavigationBar(
        items: appCubit.items(),
        onTap: (value) => appCubit.onSelected(value),
        currentIndex: appCubit.currentPage,
      );
    });
  }
}
