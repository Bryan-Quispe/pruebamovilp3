import 'package:flutter_test/flutter_test.dart';
import '../lib/controladores/capicua_controlador.dart';

/// Pruebas manuales para el controlador de Capicúa
/// Ejecutar con: flutter test test/capicua_test.dart
void main() {
  // Instanciamos el controlador
  final controlador = CapicuaControlador();

  print('==================================================');
  print('PRUEBAS MANUALES - NÚMERO CAPICÚA (Ejercicio 4)');
  print('==================================================');

  // =====================================================
  // GRUPO 1: PRUEBAS CORRECTAS
  // =====================================================
  group('Grupo 1 - Pruebas Correctas', () {
    
    // ------------------------------------------------
    // PRUEBA 1: Verificar número que SÍ es capicúa
    // ------------------------------------------------
    test('Prueba 1 - Número 12321 ES capicúa', () {
      print('\n--- PRUEBA 1: Número capicúa (12321) ---');
      
      // Arrange (Preparación)
      final numero = 12321;
      print('Datos de entrada --> número: $numero');
      print('Esperado --> Es capicúa: SÍ (se lee igual al revés)');
      
      // Act (Acción)
      final resultado = controlador.verificarCapicua(numero);
      print('Resultado obtenido:');
      print('  - Número original: ${resultado.numero}');
      print('  - Número invertido: ${resultado.numeroInvertido}');
      print('  - ¿Es capicúa?: ${resultado.esCapicua ? "SÍ" : "NO"}');
      
      // Mostrar pasos del ciclo while
      print('Pasos del ciclo while:');
      for (var paso in resultado.pasosInversion) {
        print('    $paso');
      }
      
      // Assert (Verificación)
      expect(
        resultado.esCapicua,
        isTrue,
        reason: '12321 debe ser capicúa porque 12321 == 12321 invertido',
      );
      expect(
        resultado.numeroInvertido,
        equals(12321),
        reason: 'El número invertido debe ser 12321',
      );
      
      print('✅ Prueba 1 PASADA');
    });

    // ------------------------------------------------
    // PRUEBA 2: Verificar número que NO es capicúa
    // ------------------------------------------------
    test('Prueba 2 - Número 12345 NO es capicúa', () {
      print('\n--- PRUEBA 2: Número NO capicúa (12345) ---');
      
      // Arrange (Preparación)
      final numero = 12345;
      print('Datos de entrada --> número: $numero');
      print('Esperado --> Es capicúa: NO (al revés es diferente)');
      
      // Act (Acción)
      final resultado = controlador.verificarCapicua(numero);
      print('Resultado obtenido:');
      print('  - Número original: ${resultado.numero}');
      print('  - Número invertido: ${resultado.numeroInvertido}');
      print('  - ¿Es capicúa?: ${resultado.esCapicua ? "SÍ" : "NO"}');
      
      // Mostrar pasos del ciclo while
      print('Pasos del ciclo while:');
      for (var paso in resultado.pasosInversion) {
        print('    $paso');
      }
      
      // Assert (Verificación)
      expect(
        resultado.esCapicua,
        isFalse,
        reason: '12345 NO debe ser capicúa porque 12345 != 54321',
      );
      expect(
        resultado.numeroInvertido,
        equals(54321),
        reason: 'El número invertido debe ser 54321',
      );
      
      print('✅ Prueba 2 PASADA');
    });

  });

  // =====================================================
  // GRUPO 2: PRUEBAS CASOS ESPECIALES
  // =====================================================
  group('Grupo 2 - Casos Especiales', () {
    
    // ------------------------------------------------
    // PRUEBA 3: Número de un solo dígito (siempre capicúa)
    // ------------------------------------------------
    test('Prueba 3 - Número de un dígito (7) es capicúa', () {
      print('\n--- PRUEBA 3: Número de un dígito (7) ---');
      
      // Arrange
      final numero = 7;
      print('Datos de entrada --> número: $numero');
      print('Esperado --> Es capicúa: SÍ (un dígito siempre es capicúa)');
      
      // Act
      final resultado = controlador.verificarCapicua(numero);
      print('Resultado obtenido:');
      print('  - Número original: ${resultado.numero}');
      print('  - Número invertido: ${resultado.numeroInvertido}');
      print('  - ¿Es capicúa?: ${resultado.esCapicua ? "SÍ" : "NO"}');
      
      // Assert
      expect(
        resultado.esCapicua,
        isTrue,
        reason: 'Un número de un dígito siempre es capicúa',
      );
      
      print('✅ Prueba 3 PASADA');
    });

    // ------------------------------------------------
    // PRUEBA 4: Número con ceros (1001)
    // ------------------------------------------------
    test('Prueba 4 - Número con ceros (1001) es capicúa', () {
      print('\n--- PRUEBA 4: Número con ceros (1001) ---');
      
      // Arrange
      final numero = 1001;
      print('Datos de entrada --> número: $numero');
      print('Esperado --> Es capicúa: SÍ');
      
      // Act
      final resultado = controlador.verificarCapicua(numero);
      print('Resultado obtenido:');
      print('  - Número original: ${resultado.numero}');
      print('  - Número invertido: ${resultado.numeroInvertido}');
      print('  - ¿Es capicúa?: ${resultado.esCapicua ? "SÍ" : "NO"}');
      
      // Mostrar pasos
      print('Pasos del ciclo while:');
      for (var paso in resultado.pasosInversion) {
        print('    $paso');
      }
      
      // Assert
      expect(
        resultado.esCapicua,
        isTrue,
        reason: '1001 debe ser capicúa',
      );
      expect(
        resultado.numeroInvertido,
        equals(1001),
        reason: 'El número invertido debe ser 1001',
      );
      
      print('✅ Prueba 4 PASADA');
    });

  });

  print('\n==================================================');
  print('FIN DE PRUEBAS - NÚMERO CAPICÚA');
  print('==================================================\n');
}
