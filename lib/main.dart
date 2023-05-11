import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ifarms_theme/ifarms_theme.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/http_override.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  runApp(const App());
}

final box = GetStorage();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(411, 731),
        builder: (context, child) {
          return GetMaterialApp(
            title: "Application",
            initialRoute: AppPages.INITIAL,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
              ),
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: true,
            ),
            getPages: AppPages.routes,
          );
        });
  }
}
