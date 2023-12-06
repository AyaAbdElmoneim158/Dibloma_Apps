import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/theme/app_theme.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/auth/provider/auth_provider.dart';
import '/core/language_constants.dart ';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '/core/router/router.dart';
import '/core/router/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const StoreApp());
}

class StoreApp extends StatefulWidget {
  const StoreApp({super.key});

  @override
  State<StoreApp> createState() => _StoreAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _StoreAppState? state = context.findAncestorStateOfType<_StoreAppState>();
    state?.setLocale(newLocale);
  }
}

class _StoreAppState extends State<StoreApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvide()),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: MyThemes.lightTheme,
        themeMode: ThemeMode.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        onGenerateRoute: onGenerateRoute,
        initialRoute: Routes.initialRoute,
        // home: const LanguageScreen(),
      ),
    );
  }
}
