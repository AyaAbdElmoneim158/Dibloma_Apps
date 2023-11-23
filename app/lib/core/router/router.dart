import 'package:flutter/material.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/init_page.dart';

Route? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Routes.initialRoute:
      return MaterialPageRoute(
        builder: ((context) {
          return const InitPage();
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
