import 'package:flutter/material.dart';
import 'package:todo_app/src/model/product_model.dart';
import 'package:todo_app/src/views/admin/admin_screen.dart';
import 'package:todo_app/src/views/auth/screens/login_screen.dart';
import 'package:todo_app/src/views/auth/screens/register_screen.dart';
import 'package:todo_app/src/views/auth/screens/splash_screen.dart';
import 'package:todo_app/src/views/auth/screens/verification_screen.dart';
import 'package:todo_app/src/views/category/category_products_screen.dart';
import 'package:todo_app/src/views/home/screens/details_product_screen.dart';
import 'package:todo_app/src/views/home/screens/notifications_screen.dart';
import 'package:todo_app/src/views/profile/screens/card_screen.dart';
import 'package:todo_app/src/views/profile/screens/payment_screen.dart';
import 'package:todo_app/src/views/search/search_product_screen.dart';
import 'package:todo_app/src/views/main/main.dart';
import '/core/router/routes.dart';
import 'package:page_transition/page_transition.dart';

Route? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Routes.initialRoute:
      return PageTransition(
        type: PageTransitionType.fade,
        child: const SplashScreen(),
      );

    case Routes.loginRoute:
      return PageTransition(
        type: PageTransitionType.fade,
        child: const LoginScreen(),
        settings: routeSettings,
      );

    case Routes.registerRoute:
      return PageTransition(
        type: PageTransitionType.fade,
        child: const RegisterScreen(),
        settings: routeSettings,
      );

    case Routes.mainRoute:
      return PageTransition(
        type: PageTransitionType.fade,
        child: const Main(),
        settings: routeSettings,
      );

    case Routes.adminRoute:
      return PageTransition(
        type: PageTransitionType.fade,
        child: const Admin(),
        settings: routeSettings,
      );

    case Routes.categoryProductsRoute:
      var id = routeSettings.arguments as int;
      return PageTransition(
        type: PageTransitionType.fade,
        child: CategoryProductsScreen(id: id),
        settings: routeSettings,
      );

    case Routes.cartRoute:
      return PageTransition(
        type: PageTransitionType.fade,
        child: const CardScreen(),
        settings: routeSettings,
      );

    case Routes.paymentRoute:
      return PageTransition(
        type: PageTransitionType.scale,
        child: const PaymentScreen(),
        settings: routeSettings,
      );
    case Routes.notificationRoute:
      return PageTransition(
        type: PageTransitionType.scale,
        child: const NotificationScreen(),
        settings: routeSettings,
      );

    //!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    case Routes.searchProductRoute:
      return PageTransition(
        type: PageTransitionType.fade,
        child: const SearchProductScreen(),
        settings: routeSettings,
      );
    case Routes.detailsProductRoute:
      var product = routeSettings.arguments as ProductModel;
      return PageTransition(
        type: PageTransitionType.fade,
        child: DetailsProductScreen(product: product),
        settings: routeSettings,
      );

    case Routes.verificationRoute:
      return PageTransition(
        type: PageTransitionType.fade,
        child: const VerificationScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const NotFoundPage(),
        settings: routeSettings,
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
