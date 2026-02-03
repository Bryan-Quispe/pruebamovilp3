import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Widget reutilizable para campos de entrada numérica
/// Incluye validación y estilo consistente
class CampoEntrada extends StatelessWidget {
  /// Controlador del campo de texto
  final TextEditingController controlador;

  /// Etiqueta del campo
  final String etiqueta;

  /// Texto de ayuda
  final String? textoAyuda;

  /// Ícono del campo
  final IconData icono;

  /// Función de validación
  final String? Function(String?)? validador;

  /// Si solo acepta números
  final bool soloNumeros;

  /// Función cuando cambia el valor
  final ValueChanged<String>? onCambio;

  const CampoEntrada({
    super.key,
    required this.controlador,
    required this.etiqueta,
    this.textoAyuda,
    required this.icono,
    this.validador,
    this.soloNumeros = true,
    this.onCambio,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controlador,
      keyboardType: soloNumeros ? TextInputType.number : TextInputType.text,
      inputFormatters: soloNumeros
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      validator: validador,
      onChanged: onCambio,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: etiqueta,
        helperText: textoAyuda,
        prefixIcon: Icon(icono),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            controlador.clear();
            if (onCambio != null) {
              onCambio!('');
            }
          },
        ),
      ),
    );
  }
}
