import 'package:flutter/material.dart';
import 'package:mangakyy_v2_mobile/core/colors/app_color.dart';
import 'package:mangakyy_v2_mobile/navigations/widget/app_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mangakyy v2',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.background,
        colorScheme: ColorScheme.dark(
          primary: AppColor.primary,
          surface: AppColor.card,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.background,
          elevation: 0,
        ),
      ),
      routerConfig: AppNavigation,
    );
  }
}
