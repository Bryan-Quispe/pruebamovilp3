import 'package:flutter/material.dart';
import 'app/rutas/rutas_app.dart';
import 'app/tema/tema_app.dart';

/// Punto de entrada principal de la aplicación
/// Configura el MaterialApp con rutas y tema personalizado
void main() {
  runApp(const AplicacionPrincipal());
}

/// Widget raíz de la aplicación
class AplicacionPrincipal extends StatelessWidget {
  const AplicacionPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Configuración básica
      title: 'Ejercicios de Programación',
      debugShowCheckedModeBanner: false,
      
      // Tema personalizado
      theme: TemaApp.temaClaro,
      
      // Configuración de rutas
      initialRoute: RutasApp.rutaInicio,
      onGenerateRoute: RutasApp.generarRuta,
    );
  }
}
