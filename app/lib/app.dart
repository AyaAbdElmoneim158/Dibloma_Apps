import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/helper/cache_helper.dart';
import 'package:todo_app/core/router/router.dart';
import 'package:todo_app/core/theme/app_theme.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/src/controller/app_cubit/app_cubit.dart';
import 'package:todo_app/src/controller/auth_cubit/auth_cubit.dart';
import 'package:todo_app/src/controller/category_cubit/category_cubit.dart';
import 'package:todo_app/src/controller/product_cubit/product_cubit.dart';
// import 'package:todo_app/src/test_api/test_api_screen.dart';
import '/core/router/routes.dart';

class StoreApp extends StatefulWidget {
  const StoreApp({super.key});

  @override
  State<StoreApp> createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
  String? userToken;
  String? userRole;

  @override
  void initState() {
    super.initState();
    getSharedData();
  }

  void getSharedData() async {
    userToken = CacheHelper.loadData(key: AuthCubit().userToken!);
    userRole = CacheHelper.loadData(key: AuthCubit().userRole);
    debugPrint("userToken, $userToken , userRole, $userRole ");
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => CategoryCubit()..getCategories()),
        BlocProvider(
          create: (context) => ProductCubit()
            ..getAllProduct()
            ..filterProductByTitle(title: "Generic"),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        themeMode: ThemeMode.light,
        onGenerateRoute: onGenerateRoute,
        initialRoute: _initialRoute(),
        // Routes.mainRoute,
        // home: const TestApiScreen(),
      ),
    );
  }

  String? _initialRoute() {
    if (userToken == null) {
      return Routes.initialRoute;
    } else {
      if (userRole == 'customer') {
        return Routes.mainRoute;
      } else {
        return Routes.adminRoute;
      }
    }
  }
}
