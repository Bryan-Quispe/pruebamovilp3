import 'package:flutter/material.dart';

/// Widget reutilizable para botones de ejercicio
/// Diseño moderno con gradiente y animación
class BotonEjercicio extends StatelessWidget {
  /// Título del botón
  final String titulo;

  /// Descripción corta del ejercicio
  final String descripcion;

  /// Ícono a mostrar
  final IconData icono;

  /// Color principal del gradiente
  final Color colorPrimario;

  /// Color secundario del gradiente
  final Color colorSecundario;

  /// Función a ejecutar al presionar
  final VoidCallback onPresionar;

  const BotonEjercicio({
    super.key,
    required this.titulo,
    required this.descripcion,
    required this.icono,
    required this.colorPrimario,
    required this.colorSecundario,
    required this.onPresionar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPresionar,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorPrimario, colorSecundario],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(
                    colorPrimario.r.toInt(),
                    colorPrimario.g.toInt(),
                    colorPrimario.b.toInt(),
                    0.4,
                  ),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                // Ícono con fondo circular
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icono,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 20),
                // Textos
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        descripcion,
                        style: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                // Flecha
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromRGBO(255, 255, 255, 0.7),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
