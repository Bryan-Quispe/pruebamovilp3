/// Modelo para la verificación de números capicúa
/// Contiene los datos relacionados con el análisis del número
class CapicuaModelo {
  /// Número original ingresado
  final int numero;

  /// Indica si el número es capicúa
  final bool esCapicua;

  /// Número invertido para mostrar al usuario
  final int numeroInvertido;

  /// Lista de pasos del proceso de inversión (para demostración)
  final List<String> pasosInversion;

  /// Constructor del modelo
  CapicuaModelo({
    required this.numero,
    required this.esCapicua,
    required this.numeroInvertido,
    required this.pasosInversion,
  });

  /// Obtiene el mensaje de resultado
  String get mensajeResultado {
    if (esCapicua) {
      return '¡Sí es capicúa!';
    } else {
      return 'No es capicúa';
    }
  }

  @override
  String toString() {
    return 'CapicuaModelo(numero: $numero, invertido: $numeroInvertido, esCapicua: $esCapicua)';
  }
}
