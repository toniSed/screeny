import 'package:flutter/material.dart';
import 'package:screeny/screens/home_page.dart';
import 'package:screeny/screens/login_pages/doomur_login.dart';
import 'package:screeny/screens/login_pages/fuel_cash.dart';
import 'package:screeny/screens/login_pages/sample_1_login.dart';
import 'package:screeny/screens/login_pages/sample_2_login.dart';
import 'package:screeny/utils/app_theme.dart';


void main() {
  var theme = ValueNotifier(ThemeMode.system);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MaterialApp(
        home: const HomePage(),
        title: "Screeny",

        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routes: {
          "/doomur":(context)=>DoomurLogin(),
          "/fuelcash":(context)=>FuelCashLogin(),
          "/sample1":(context)=>Sample1Login(),
          "/sample2":(context)=>Sample2Login()
        },
        onGenerateRoute: (RouteSettings settings) {
          assert(false, 'Need to implement ${settings.name}');
          return null;
        },
      )
  );
}