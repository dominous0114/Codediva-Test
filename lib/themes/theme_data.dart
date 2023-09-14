import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  ThemeData theme() {
    return ThemeData(
      indicatorColor: Colors.white,
      focusColor: Colors.black,
      useMaterial3: true,
      primaryColor: Colors.white,
      cardColor: Colors.deepPurple.shade200,
      scaffoldBackgroundColor: Colors.grey.shade100,
      appBarTheme: AppBarTheme(color: Colors.deepPurple.shade400, actionsIconTheme: IconThemeData(color: Colors.white), centerTitle: true, titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
      iconTheme: IconThemeData(color: Colors.deepPurple.shade300),
      progressIndicatorTheme: ProgressIndicatorThemeData(circularTrackColor: Colors.white),
      cupertinoOverrideTheme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(color: Colors.red, fontSize: 16),
          tabLabelTextStyle: TextStyle(color: Colors.red, fontSize: 16),
          navTitleTextStyle: TextStyle(color: Colors.red, fontSize: 16),
          navLargeTitleTextStyle: TextStyle(color: Colors.red, fontSize: 16),
          actionTextStyle: TextStyle(color: Colors.red, fontSize: 16),
          navActionTextStyle: TextStyle(color: Colors.red, fontSize: 16),
          dateTimePickerTextStyle: TextStyle(color: Colors.red, fontSize: 16),
          pickerTextStyle: TextStyle(color: Colors.red, fontSize: 12),
          primaryColor: Colors.red,
        ),
      ),
      textTheme: textTheme(),
      //snackBarTheme: SnackBarThemeData(contentTextStyle: GoogleFonts.ibmPlexSansThai(fontSize: 16)),
    );
  }

  TextTheme textTheme() {
    return TextTheme(
      displayLarge: TextStyle(fontFamily: 'SukhumvitSet', fontSize: 20, color: Colors.white),
      displayMedium: TextStyle(fontFamily: 'SukhumvitSet', fontSize: 18, color: Colors.white),
      displaySmall: TextStyle(fontFamily: 'SukhumvitSet', fontSize: 16, color: Colors.white),
      headlineMedium: TextStyle(fontFamily: 'SukhumvitSet', fontSize: 15, color: Colors.white),
      headlineSmall: TextStyle(fontFamily: 'SukhumvitSet', fontSize: 14, color: Colors.white),
      titleLarge: TextStyle(fontFamily: 'SukhumvitSet', fontSize: 12, color: Colors.white),
      bodyLarge: TextStyle(fontFamily: 'SukhumvitSet', fontSize: 10, color: Colors.white),
      bodyMedium: TextStyle(fontFamily: 'SukhumvitSet', fontSize: 16, color: Colors.white),
    );
  }
}
