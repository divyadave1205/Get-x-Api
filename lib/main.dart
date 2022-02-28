import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbo_admin_pannel/utilities/langauges/arabic.dart';
import 'package:mbo_admin_pannel/utilities/route_utilities.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: RouteUtilities.root,
      getPages: RouteUtilities.getPages(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: const Locale("ar", "SA"),
      fallbackLocale: const Locale("ar", "SA"),
      translations: ApplicationLanguages(),
    );
  }
}

class ApplicationLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar_SA': arabic, // Arabic Language.
      };
}
