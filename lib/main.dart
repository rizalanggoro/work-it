import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_it/app/bindings/initial.dart';
import 'package:work_it/app/routes.dart';

void main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        textTheme: GoogleFonts.poppinsTextTheme(),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        textTheme: GoogleFonts.poppinsTextTheme(),
        brightness: Brightness.dark,
      ),
      defaultTransition: Transition.cupertino,
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      getPages: Routes.pages,
    );
  }
}
