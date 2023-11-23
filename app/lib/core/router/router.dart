import 'package:flutter/material.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/features/auth/screens/login_screen.dart';
import 'package:todo_app/features/auth/screens/register_screen.dart';
import 'package:todo_app/features/auth/screens/verification_screen.dart';
import 'package:todo_app/features/home/main_screen.dart';
import 'package:todo_app/features/splash/splash_screen.dart';

Route? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Routes.initialRoute:
      return MaterialPageRoute(
        builder: ((context) {
          return const SplashScreen();
        }),
      );
    case Routes.loginRoute:
      return MaterialPageRoute(
        builder: ((context) {
          return const LoginScreen();
        }),
      );
    case Routes.registerRoute:
      return MaterialPageRoute(
        builder: ((context) {
          return const RegisterScreen();
        }),
      );
    case Routes.verificationRoute:
      return MaterialPageRoute(
        builder: ((context) {
          return const VerificationScreen();
        }),
      );
    case Routes.mainRoute:
      return MaterialPageRoute(
        builder: ((context) {
          return const MainScreen();
        }),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const NotFoundPage(),
      );
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(Routes.noRouteFound),
      ),
    );
  }
}
