import 'package:flutter/material.dart';

/// Widget reutilizable para mostrar resultados
/// Diseño de tarjeta con animación y colores dinámicos
class TarjetaResultado extends StatelessWidget {
  /// Título de la tarjeta
  final String titulo;

  /// Contenido principal (resultado)
  final String contenido;

  /// Subtítulo o información adicional
  final String? subtitulo;

  /// Indica si el resultado es positivo/éxito
  final bool esExito;

  /// Ícono a mostrar
  final IconData icono;

  /// Lista adicional de detalles
  final List<String>? detalles;

  const TarjetaResultado({
    super.key,
    required this.titulo,
    required this.contenido,
    this.subtitulo,
    this.esExito = true,
    required this.icono,
    this.detalles,
  });

  @override
  Widget build(BuildContext context) {
    final colorExito = const Color(0xFF10B981);
    final colorInfo = const Color(0xFF6366F1);
    final colorBase = esExito ? colorExito : colorInfo;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Card(
        elevation: 6,
        shadowColor: Color.fromRGBO(
          colorBase.r.toInt(),
          colorBase.g.toInt(),
          colorBase.b.toInt(),
          0.3,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Color.fromRGBO(
              colorBase.r.toInt(),
              colorBase.g.toInt(),
              colorBase.b.toInt(),
              0.3,
            ),
            width: 1,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Color.fromRGBO(
                  colorBase.r.toInt(),
                  colorBase.g.toInt(),
                  colorBase.b.toInt(),
                  0.05,
                ),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              // Ícono con fondo
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(
                    colorBase.r.toInt(),
                    colorBase.g.toInt(),
                    colorBase.b.toInt(),
                    0.1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icono,
                  color: colorBase,
                  size: 40,
                ),
              ),
              const SizedBox(height: 16),
              // Título
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              // Contenido principal
              Text(
                contenido,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: colorBase,
                ),
                textAlign: TextAlign.center,
              ),
              // Subtítulo
              if (subtitulo != null) ...[
                const SizedBox(height: 8),
                Text(
                  subtitulo!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              // Detalles adicionales
              if (detalles != null && detalles!.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 8),
                ...detalles!.map((detalle) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    detalle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                  ),
                )),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
