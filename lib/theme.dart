import 'import.dart';

class ThemeHelper {
  static ThemeData lightTheme = ThemeData(
      //  primarySwatch: Colors.blue,
      brightness: Brightness.light,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color.fromARGB(255, 168, 54, 250),
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal),
        bodyMedium: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal),
        titleLarge:
            GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold),
            titleMedium: GoogleFonts.poppins(
              fontSize: 16,
              
            )
      ),
      buttonTheme: ButtonThemeData());

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    //  accentColorBrightness: Brightness.dark,
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal),
      bodyMedium: GoogleFonts.poppins(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal),
      titleLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
