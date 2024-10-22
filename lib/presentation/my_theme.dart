import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getTheme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1A6FEE),
        primary: const Color(0xFF1A6FEE),
        error: const Color(0xFFFD3535),
        onSurface: const Color(0xFF000000),
        onSurfaceVariant: const Color(0xFF939396),
        background: const Color(0xFFFFFFFF)

    ),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.montserrat(
          fontSize: 24,
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.w500
      ),
      headlineSmall: GoogleFonts.montserrat(
          fontSize: 20,
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.w500
      ),
      bodyLarge: GoogleFonts.montserrat(
          fontSize: 17,
          color: Theme.of(context).colorScheme.onSurface
      ),
      bodyMedium: GoogleFonts.montserrat(
          fontSize: 16
      ),
      bodySmall: GoogleFonts.montserrat(
          fontSize: 15,
          color: const Color(0xFF939396)
      ),
    ),
  );
}