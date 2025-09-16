import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


const backgroundColorLight =  Color(0xFFF5F5F5);
const backgroundColor =  Color(0xFFFFFFFF);
const backgroundColorDark =  Color(0xFFF5F5F5);

const cardLight =  Color(0xffffffff);

const backgroundDark =  Color(0xFF000000);
const darkBackgroundBlueBlack = Color(0xff040D27);
const cardDark  = Color(0xff282828);


const primaryColor =  Color(0xff000000);



const accentColor =  Color(0xff95c623);
const accentColorLight =  Color(0xffe7f1e4);

const textColorPrimary =  Color(0xff020d23);
const textColorPrimaryDark =  Color(0xff00040a);
const textColorPrimaryLight =  Color(0xff43475b);
const borderColor = Color(0xffCDD1D1);



class AppTheme {

  static final ThemeData lightTheme = _buildMyTheme();
  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light(useMaterial3: true);
    return base.copyWith(

      canvasColor: backgroundColor,

      primaryColor: primaryColor,
      primaryColorDark:primaryColor,
      primaryColorLight: Colors.grey,

      outlinedButtonTheme:OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
        ),),

      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.primary, ),

      scaffoldBackgroundColor: backgroundColor, cardColor: backgroundColorLight,
      unselectedWidgetColor:Colors.grey,
      brightness: Brightness.light,

      cardTheme: base.cardTheme.copyWith(
          color: cardLight,
          surfaceTintColor: cardLight,
          elevation: 6,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          )
      ),


      // elevatedButtonTheme: base.elevatedButtonTheme.style,
      textTheme: base.textTheme.copyWith(

          headlineMedium: base.textTheme.headlineMedium!.copyWith(
              color: textColorPrimary.withOpacity(0.8),
              fontFamily: "SFPro",
              fontSize: 23,
              fontWeight: FontWeight.w600
          ),

          headlineLarge: base.textTheme.headlineLarge!.copyWith(
              color: textColorPrimary,
              fontFamily: "SFPro",
              fontSize: 32,
              fontWeight: FontWeight.w600
          ),

          headlineSmall: base.textTheme.headlineSmall!.copyWith(
              color: textColorPrimaryDark,
              fontSize: 19,
              fontFamily: "SFPro",
              fontWeight: FontWeight.w600
          ),

          titleLarge: base.textTheme.titleLarge!.copyWith(color: textColorPrimary,fontFamily: "SFPro"),



          bodyMedium: base.textTheme.bodyMedium!.copyWith(
              fontFamily: "SFPro",
              color: textColorPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500),

          bodySmall: base.textTheme.bodySmall!.copyWith(
              fontSize: 12,
              fontFamily: "SFPro",
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500
          ),

          bodyLarge: base.textTheme.bodyLarge!.copyWith(
              color: textColorPrimaryLight,fontWeight: FontWeight.w600
              ,fontFamily: "SFPro",
              fontSize: 18
          ) ),


      colorScheme: base.colorScheme.copyWith(
          primary: primaryColor,
          outline:Colors.grey,
          brightness: Brightness.dark,
          onPrimary: accentColor,
          secondary: accentColor,
          onSecondary: textColorPrimary,
          error: Colors.redAccent,
          onError: Colors.redAccent,
          surface: backgroundColor,

          onSurface: textColorPrimary,
          surfaceContainer: backgroundColorDark
      ),

      appBarTheme:  const AppBarTheme(
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
          statusBarColor: backgroundColor,
        ),
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        elevation: 0,
        centerTitle: true,

        iconTheme:  IconThemeData(
          color: primaryColor , //change your color here
        ),
        titleTextStyle: TextStyle(color: textColorPrimaryDark,
            fontWeight: FontWeight.w600,fontSize: 22,
            fontFamily: "SFPro"),
      ),

    );
  }


  static final ThemeData darkTheme = _buildDarkTheme();

  static ThemeData _buildDarkTheme() {
    final ThemeData base = ThemeData.light(useMaterial3: true);
    return base.copyWith(

      canvasColor: backgroundDark,

      primaryColor: backgroundColorLight,
      primaryColorDark: backgroundColorDark,
      primaryColorLight: backgroundColor,

      outlinedButtonTheme:OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
        ),),

      buttonTheme: base.buttonTheme.copyWith( buttonColor: primaryColor,
        textTheme: ButtonTextTheme.primary, ),

      scaffoldBackgroundColor: backgroundDark, cardColor: backgroundColorLight,
      unselectedWidgetColor:Colors.grey,
      brightness: Brightness.dark,

      cardTheme: base.cardTheme.copyWith(
          color: cardDark,
          surfaceTintColor: cardDark,
          elevation: 6,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          )
      ),


      textTheme: base.textTheme.copyWith(
          headlineMedium: base.textTheme.headlineMedium!.copyWith(
              color: Colors.white,
              fontFamily: "SFPro",
              fontSize: 23,
              fontWeight: FontWeight.w600
          ),

          headlineLarge: base.textTheme.headlineLarge!.copyWith(
              color: Colors.white,
              fontFamily: "SFPro",
              fontSize: 32,
              fontWeight: FontWeight.w600
          ),

          headlineSmall: base.textTheme.headlineSmall!.copyWith(
              color: Colors.white,
              fontSize: 19,
              fontFamily: "SFPro",
              fontWeight: FontWeight.w600
          ),

          titleLarge: base.textTheme.titleLarge!.copyWith(color: Colors.white,fontFamily: "SFPro"),



          bodyMedium: base.textTheme.bodyMedium!.copyWith(
              fontFamily: "SFPro",
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500),

          bodySmall: base.textTheme.bodySmall!.copyWith(
              fontSize: 12,
              fontFamily: "SFPro",
              color: Colors.white60,
              fontWeight: FontWeight.w500
          ),

          bodyLarge: base.textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600
              ,fontFamily: "SFPro",
              fontSize: 18
          ) ),


      colorScheme: base.colorScheme.copyWith(
        primary: primaryColor,
        brightness: Brightness.dark,
        onPrimary: accentColor,
        secondary: cardLight,
        onSecondary: textColorPrimary,
        error: Colors.redAccent,
        onError: Colors.redAccent,
        surface: backgroundDark,
        outline: Colors.grey,
        onSurface: textColorPrimary,
        surfaceContainer: cardDark,

      ),

      datePickerTheme: base.datePickerTheme.copyWith(
        backgroundColor: backgroundDark,
        surfaceTintColor: backgroundDark,


        weekdayStyle: const TextStyle(
            color: Colors.white60
        ),
        dayStyle: const TextStyle(
            fontFamily: "SFPro",
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500
        ),
        headerHeadlineStyle: const TextStyle(
            color: Colors.white,
            fontFamily: "SFPro",
            fontSize: 23,
            fontWeight: FontWeight.w600
        ),
        yearStyle: const TextStyle(
            color: Colors.white
        ),

      ),


      appBarTheme:  const AppBarTheme(
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
          statusBarColor: backgroundDark,
        ),
        backgroundColor: backgroundDark,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        elevation: 0,
        centerTitle: true,

        iconTheme:  IconThemeData(
          color:  Colors.white, //change your color here
        ),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 22,
            fontFamily: "SFPro"),
      ),

    );
  }



}