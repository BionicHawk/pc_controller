import 'package:flutter/material.dart';
import 'package:pc_controller/Screens/Home/home.dart';
import 'package:pc_controller/Screens/settings_screen/settings_screen.dart';
import 'package:pc_controller/api/connection_strings.dart';
import 'package:pc_controller/api/settings/settings.service.dart';
import 'package:pc_controller/settings/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SettingsService.loadPreferences();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    // Getting a boilerplateless access to the MediaQuery
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    

    Brightness brightness = mediaQuery.platformBrightness;

    switch (SettingsService.themeModeOption) {
      case ThemeModeOption.system:
        brightness = mediaQuery.platformBrightness;
        break;
      case ThemeModeOption.light:
        brightness = Brightness.light;
        break;
      case ThemeModeOption.dark:
        brightness = Brightness.dark;
        break;
    }

    final isLight = brightness == Brightness.light;

    // Theme Colors
    final primaryColor = isLight ? CustomTheme.primaryColor : CustomThemeDark.primaryColor;
    final primaryBgColor = isLight ? CustomTheme.backgroundColor : CustomThemeDark.backgroundColor;
    final bottomSheetBgColor = isLight? CustomTheme.bottomSheetBg : CustomThemeDark.bottomSheetBg;
    final headerBgColor = isLight ? CustomTheme.headerColor : CustomThemeDark.headerColor;

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true, 
        brightness: brightness, 
        scaffoldBackgroundColor: primaryBgColor,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: bottomSheetBgColor,
        ),
        dialogTheme: DialogTheme(
          backgroundColor: bottomSheetBgColor,
          iconColor: primaryColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: headerBgColor 
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
