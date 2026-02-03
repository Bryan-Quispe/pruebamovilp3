import '../modelos/capicua_modelo.dart';

/// Controlador para verificar si un número es capicúa
/// Contiene la lógica de negocio usando ciclos repetitivos
class CapicuaControlador {
  /// Verifica si un número es capicúa (palíndromo numérico)
  /// Utiliza un ciclo while para invertir el número
  /// 
  /// Un número capicúa se lee igual de izquierda a derecha
  /// que de derecha a izquierda. Ejemplo: 12321
  CapicuaModelo verificarCapicua(int numero) {
    // Guardamos el número original para comparar
    final int numeroOriginal = numero.abs();
    int numeroTemporal = numeroOriginal;
    int numeroInvertido = 0;
    List<String> pasos = [];

    // Paso inicial
    pasos.add('Número original: $numeroOriginal');
    pasos.add('Iniciando inversión...');

    // Uso de ciclo while para invertir el número
    int iteracion = 1;
    while (numeroTemporal > 0) {
      // Obtener el último dígito
      int ultimoDigito = numeroTemporal % 10;
      
      // Agregar el dígito al número invertido
      numeroInvertido = (numeroInvertido * 10) + ultimoDigito;
      
      // Registrar el paso
      pasos.add('Iteración $iteracion: dígito=$ultimoDigito, invertido=$numeroInvertido');
      
      // Eliminar el último dígito del número temporal
      numeroTemporal = numeroTemporal ~/ 10;
      
      iteracion++;
    }

    // Comparar el número original con el invertido
    bool esCapicua = numeroOriginal == numeroInvertido;
    
    pasos.add('Número invertido final: $numeroInvertido');
    pasos.add('¿Es capicúa? ${esCapicua ? "Sí" : "No"}');

    return CapicuaModelo(
      numero: numeroOriginal,
      esCapicua: esCapicua,
      numeroInvertido: numeroInvertido,
      pasosInversion: pasos,
    );
  }

  /// Valida que el número ingresado sea válido
  String? validarNumero(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor ingrese un número';
    }

    final numero = int.tryParse(valor);
    if (numero == null) {
      return 'Por favor ingrese un número válido';
    }

    if (numero < 0) {
      return 'Por favor ingrese un número positivo';
    }

    return null;
  }

  /// Verifica si un número es capicúa usando método alternativo con String
  /// (Para demostración de diferentes enfoques)
  bool esCapicuaConString(int numero) {
    String numeroStr = numero.abs().toString();
    String invertidoStr = '';
    
    // Uso de ciclo for para invertir usando índices
    for (int i = numeroStr.length - 1; i >= 0; i--) {
      invertidoStr += numeroStr[i];
    }
    
    return numeroStr == invertidoStr;
  }
}
