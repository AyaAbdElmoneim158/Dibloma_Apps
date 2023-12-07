import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/features/providers/auth_provider.dart';
import '/core/router/routes.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/asset_manager.dart';
import '/core/utils/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      debugPrint(
          "authStatus At Splash: ${Provider.of<AuthProvide>(context, listen: false).authStatus}");
      Provider.of<AuthProvide>(context, listen: false).authStatus ==
              AuthStatus.userUnAuthorized
          ? Navigator.pushReplacementNamed(context, Routes.loginRoute)
          : Navigator.pushReplacementNamed(context, Routes.mainRoute);
      //! Navigator.pushReplacementNamed(context, Routes.loginRoute,arguments: {"name": "Aya", "Email": "aya@example.com"});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.shoppingImage,
            ),
            Text(
              AppStrings.splashText,
              style: TextStyles.getSplashTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
