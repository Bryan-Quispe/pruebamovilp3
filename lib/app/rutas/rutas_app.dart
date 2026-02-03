import 'package:flutter/material.dart';
import '../../vistas/pagina_principal.dart';
import '../../vistas/viaje_escolar/viaje_escolar_vista.dart';
import '../../vistas/capicua/capicua_vista.dart';

/// Configuración de rutas de la aplicación
/// Maneja la navegación entre las diferentes pantallas
class RutasApp {
  // Nombres de las rutas
  static const String rutaInicio = '/';
  static const String rutaViajeEscolar = '/viaje-escolar';
  static const String rutaCapicua = '/capicua';

  /// Genera las rutas de la aplicación
  static Route<dynamic> generarRuta(RouteSettings configuracion) {
    switch (configuracion.name) {
      case rutaInicio:
        return _crearRuta(const PaginaPrincipal());
      case rutaViajeEscolar:
        return _crearRuta(const ViajeEscolarVista());
      case rutaCapicua:
        return _crearRuta(const CapicuaVista());
      default:
        return _crearRuta(const PaginaPrincipal());
    }
  }

  /// Crea una ruta con animación de transición
  static PageRouteBuilder _crearRuta(Widget pagina) {
    return PageRouteBuilder(
      pageBuilder: (context, animacion, animacionSecundaria) => pagina,
      transitionsBuilder: (context, animacion, animacionSecundaria, hijo) {
        // Animación de deslizamiento desde la derecha
        const inicio = Offset(1.0, 0.0);
        const fin = Offset.zero;
        const curva = Curves.easeInOut;

        var tween = Tween(begin: inicio, end: fin).chain(
          CurveTween(curve: curva),
        );

        return SlideTransition(
          position: animacion.drive(tween),
          child: hijo,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
