import 'package:flutter/material.dart';
import '/core/router/routes.dart';
import '/features/views/auth_views/screens/login_screen.dart';
import '/features/views/auth_views/screens/register_screen.dart';
import '/features/views/auth_views/screens/verification_screen.dart';
import '/features/views/home_views/screens/card_screen.dart';
import '/features/views/profile_views/screens/language_screen.dart';
import '/features/views/profile_views/screens/shipping_address.dart';
import '/features/views/home_views/screens/details_screen.dart';
import '/features/views/home_views/screens/notifications_screen.dart';
import '/features/views/main_views/main_screen.dart';
import '/features/views/auth_views/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';
//! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// final args = routeSettings.arguments as Map<String, dynamic>;
// final product = args['product'];
// final database = args['database'];
// arguments: product,
//! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
    case Routes.verificationRoute:
      return PageTransition(
          type: PageTransitionType.fade, child: const VerificationScreen());
    // MaterialPageRoute(builder: ((context) {return const VerificationScreen();}),);
    case Routes.mainRoute:
      return PageTransition(
        type: PageTransitionType.fade,
        child: const MainScreen(),
        settings: routeSettings,
      );

    case Routes.detailsProductRoute:
      final id = routeSettings.arguments as String;

      return PageTransition(
        type: PageTransitionType.fade,
        child: DetailsScreen(
          // product: dummyProducts[1],
          productId: id,
        ),
        settings: routeSettings,
      );
    case Routes.notificationRoute:
      return PageTransition(
        type: PageTransitionType.fade,
        child: const NotificationScreen(),
        settings: routeSettings,
      );
    case Routes.cartRoute:
      return PageTransition(
        type: PageTransitionType.fade,
        child: const CardScreen(),
        settings: routeSettings,
      );
    case Routes.shippingAddressRoute:
      return PageTransition(
        type: PageTransitionType.fade,
        child: const ShippingAddress(),
        settings: routeSettings,
      );
    case Routes.languageRoute:
      return PageTransition(
        type: PageTransitionType.fade,
        child: const LanguageScreen(),
        settings: routeSettings,
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
