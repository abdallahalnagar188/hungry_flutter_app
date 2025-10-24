import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hungry_flutter_app/core/localization/app_translations.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Load saved language
  final prefs = await SharedPreferences.getInstance();
  final langCode = prefs.getString('langCode') ?? 'en';
  final countryCode = prefs.getString('countryCode') ?? 'US';
  final savedLocale = Locale(langCode, countryCode);

  runApp(MyApp(savedLocale: savedLocale));
}

class MyApp extends StatelessWidget {
  final Locale savedLocale;

  MyApp({super.key, required this.savedLocale});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: savedLocale,
        translations: AppTranslations(),
        fallbackLocale: const Locale('en', 'US'),
        title: 'Hungry App',
        initialRoute: AppRoutes.splash,
        getPages: AppPages.routes,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'IBMPlexSansArabic',
        ),
      ),
    );
  }
}
