import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_constant.dart';

class Styles {
  static ThemeData themeLight = FlexThemeData.light(
    scheme: FlexScheme.materialBaseline,
    fontFamily: "SFPRODISPLAY",
    scaffoldBackground: Color(0xfffafafa),
    primary: Color(0xff9dc440),
    secondary: Color(0xff1c79bd),
    appBarBackground: Colors.white,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        cardRadius: 12.0,

        cardElevation: 0.0),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    textTheme: GoogleFonts.aBeeZeeTextTheme(),
    swapLegacyOnMaterial3: true,
    // To use the Playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
  );
  static ThemeData darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.materialBaseline,
    fontFamily: "SFPRODISPLAY",
    primary: Color(0xff9dc440),
    secondary: Color(0xff1c79bd),
 

    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
    ),
    
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    textTheme: GoogleFonts.latoTextTheme(),
    swapLegacyOnMaterial3: true,
    // To use the Playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
  );
}
