import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/providers/main_provider.dart';
import 'package:todo_app/features/views/main_views/main_screen.dart';
import '/core/utils/language_constants.dart';
import '/features/providers/auth_provider.dart';
import '/features/providers/theme_provider.dart';
import '/core/theme/app_theme.dart';
import '/core/utils/app_strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
        ChangeNotifierProvider(create: (_) => MainProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvide()),
      ],
      child: MyApp(locale: _locale),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required Locale? locale,
  }) : _locale = locale;

  final Locale? _locale;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: themeProvider.darkTheme ? ThemeMode.light : ThemeMode.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      // onGenerateRoute: onGenerateRoute,
      // initialRoute: Routes.initialRoute,
      home: const MainScreen(),
    );
  }
}
