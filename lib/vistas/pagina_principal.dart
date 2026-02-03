import 'package:flutter/material.dart';
import '../app/rutas/rutas_app.dart';
import '../widgets/boton_ejercicio.dart';

/// Página principal de la aplicación
/// Muestra los botones para acceder a cada ejercicio
class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Logo o ícono de la app
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.calculate_rounded,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
                const SizedBox(height: 24),
                // Título
                const Text(
                  'Ejercicios de\nProgramación',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Selecciona un ejercicio para comenzar',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.8),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 48),
                // Botones de ejercicios
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Ejercicio 3: Viaje Escolar
                        BotonEjercicio(
                          titulo: 'Ejercicio 3',
                          descripcion: 'Calculadora de Viaje Escolar',
                          icono: Icons.directions_bus_rounded,
                          colorPrimario: const Color(0xFF00b09b),
                          colorSecundario: const Color(0xFF96c93d),
                          onPresionar: () {
                            Navigator.pushNamed(
                              context,
                              RutasApp.rutaViajeEscolar,
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        // Ejercicio 4: Capicúa
                        BotonEjercicio(
                          titulo: 'Ejercicio 4',
                          descripcion: 'Verificador de Número Capicúa',
                          icono: Icons.swap_horiz_rounded,
                          colorPrimario: const Color(0xFFf857a6),
                          colorSecundario: const Color(0xFFff5858),
                          onPresionar: () {
                            Navigator.pushNamed(
                              context,
                              RutasApp.rutaCapicua,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // Footer
                const SizedBox(height: 24),
                const Text(
                  'Aplicación MVC con Flutter',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
