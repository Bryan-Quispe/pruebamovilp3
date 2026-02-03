import 'package:flutter/material.dart';

/// Tema personalizado de la aplicación
/// Configura colores, tipografía y estilos globales
class TemaApp {
  // Colores principales
  static const Color colorPrimario = Color(0xFF6366F1); // Indigo
  static const Color colorSecundario = Color(0xFF8B5CF6); // Violeta
  static const Color colorAcento = Color(0xFF06B6D4); // Cyan
  static const Color colorFondo = Color(0xFFF8FAFC); // Gris claro
  static const Color colorTarjeta = Colors.white;
  static const Color colorTexto = Color(0xFF1E293B); // Gris oscuro
  static const Color colorTextoSecundario = Color(0xFF64748B);
  static const Color colorExito = Color(0xFF10B981); // Verde
  static const Color colorError = Color(0xFFEF4444); // Rojo

  /// Tema claro de la aplicación
  static ThemeData get temaClaro {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colorPrimario,
        primary: colorPrimario,
        secondary: colorSecundario,
        surface: colorFondo,
        error: colorError,
      ),
      scaffoldBackgroundColor: colorFondo,
      appBarTheme: const AppBarTheme(
        backgroundColor: colorPrimario,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      cardTheme: CardThemeData(
        color: colorTarjeta,
        elevation: 4,
        shadowColor: const Color.fromRGBO(99, 102, 241, 51), // 0.2 * 255 = 51
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorPrimario,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color.fromRGBO(99, 102, 241, 77)), // 0.3 * 255 = 77
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color.fromRGBO(99, 102, 241, 77)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: colorPrimario, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelStyle: const TextStyle(color: colorTextoSecundario),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: colorTexto,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: colorTexto,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: colorTexto,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: colorTexto,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: colorTextoSecundario,
        ),
      ),
    );
  }
}
