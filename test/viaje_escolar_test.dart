import 'package:flutter_test/flutter_test.dart';
import '../lib/controladores/viaje_escolar_controlador.dart';

/// Pruebas manuales para el controlador de Viaje Escolar
/// Ejecutar con: flutter test test/viaje_escolar_test.dart
void main() {
  // Instanciamos el controlador
  final controlador = ViajeEscolarControlador();

  print('==================================================');
  print('PRUEBAS MANUALES - VIAJE ESCOLAR (Ejercicio 3)');
  print('==================================================');

  // =====================================================
  // GRUPO 1: PRUEBAS CORRECTAS
  // =====================================================
  group('Grupo 1 - Pruebas Correctas', () {
    
    // ------------------------------------------------
    // PRUEBA 1: Costo con 100 o más alumnos
    // ------------------------------------------------
    test('Prueba 1 - Cálculo con 100 o más alumnos (\$65.00 c/u)', () {
      print('\n--- PRUEBA 1: 100 o más alumnos ---');
      
      // Arrange (Preparación)
      final cantidadAlumnos = 120;
      print('Datos de entrada --> cantidad de alumnos: $cantidadAlumnos');
      print('Regla aplicada --> 100+ alumnos: \$65.00 por alumno');
      
      // Act (Acción)
      final resultado = controlador.calcularCosto(cantidadAlumnos);
      print('Resultado obtenido:');
      print('  - Costo por alumno: \$${resultado.costoPorAlumno}');
      print('  - Costo total: \$${resultado.costoTotal}');
      print('  - Es renta fija: ${resultado.esRentaFija}');
      
      // Assert (Verificación)
      // Cálculo esperado: 120 * 65 = 7800
      expect(
        resultado.costoPorAlumno,
        equals(65.00),
        reason: 'Con 100+ alumnos, el costo debe ser \$65.00 por alumno',
      );
      expect(
        resultado.costoTotal,
        closeTo(7800.00, 0.01),
        reason: 'El total debe ser 120 * 65 = \$7,800.00',
      );
      expect(
        resultado.esRentaFija,
        isFalse,
        reason: 'No debe ser renta fija',
      );
      
      print('✅ Prueba 1 PASADA');
    });

    // ------------------------------------------------
    // PRUEBA 2: Costo con menos de 30 alumnos (renta fija)
    // ------------------------------------------------
    test('Prueba 2 - Cálculo con menos de 30 alumnos (\$4,000 fijo)', () {
      print('\n--- PRUEBA 2: Menos de 30 alumnos ---');
      
      // Arrange (Preparación)
      final cantidadAlumnos = 25;
      print('Datos de entrada --> cantidad de alumnos: $cantidadAlumnos');
      print('Regla aplicada --> <30 alumnos: \$4,000.00 renta fija');
      
      // Act (Acción)
      final resultado = controlador.calcularCosto(cantidadAlumnos);
      print('Resultado obtenido:');
      print('  - Costo por alumno: \$${resultado.costoPorAlumno.toStringAsFixed(2)}');
      print('  - Costo total: \$${resultado.costoTotal}');
      print('  - Es renta fija: ${resultado.esRentaFija}');
      
      // Assert (Verificación)
      // Cálculo esperado: $4000 fijo, costo por alumno = 4000/25 = 160
      expect(
        resultado.costoTotal,
        equals(4000.00),
        reason: 'Con <30 alumnos, el costo total debe ser \$4,000.00 fijo',
      );
      expect(
        resultado.costoPorAlumno,
        closeTo(160.00, 0.01),
        reason: 'Costo por alumno = 4000/25 = \$160.00',
      );
      expect(
        resultado.esRentaFija,
        isTrue,
        reason: 'Debe ser renta fija',
      );
      
      print('✅ Prueba 2 PASADA');
    });

  });

  // =====================================================
  // GRUPO 2: PRUEBAS ADICIONALES (RANGOS INTERMEDIOS)
  // =====================================================
  group('Grupo 2 - Pruebas de Rangos Intermedios', () {
    
    // ------------------------------------------------
    // PRUEBA 3: Costo con 50-99 alumnos
    // ------------------------------------------------
    test('Prueba 3 - Cálculo con 50-99 alumnos (\$70.00 c/u)', () {
      print('\n--- PRUEBA 3: 50-99 alumnos ---');
      
      // Arrange
      final cantidadAlumnos = 75;
      print('Datos de entrada --> cantidad de alumnos: $cantidadAlumnos');
      print('Regla aplicada --> 50-99 alumnos: \$70.00 por alumno');
      
      // Act
      final resultado = controlador.calcularCosto(cantidadAlumnos);
      print('Resultado obtenido:');
      print('  - Costo por alumno: \$${resultado.costoPorAlumno}');
      print('  - Costo total: \$${resultado.costoTotal}');
      
      // Assert
      // Cálculo esperado: 75 * 70 = 5250
      expect(
        resultado.costoPorAlumno,
        equals(70.00),
        reason: 'Con 50-99 alumnos, el costo debe ser \$70.00 por alumno',
      );
      expect(
        resultado.costoTotal,
        closeTo(5250.00, 0.01),
        reason: 'El total debe ser 75 * 70 = \$5,250.00',
      );
      
      print('✅ Prueba 3 PASADA');
    });

    // ------------------------------------------------
    // PRUEBA 4: Costo con 30-49 alumnos
    // ------------------------------------------------
    test('Prueba 4 - Cálculo con 30-49 alumnos (\$95.00 c/u)', () {
      print('\n--- PRUEBA 4: 30-49 alumnos ---');
      
      // Arrange
      final cantidadAlumnos = 40;
      print('Datos de entrada --> cantidad de alumnos: $cantidadAlumnos');
      print('Regla aplicada --> 30-49 alumnos: \$95.00 por alumno');
      
      // Act
      final resultado = controlador.calcularCosto(cantidadAlumnos);
      print('Resultado obtenido:');
      print('  - Costo por alumno: \$${resultado.costoPorAlumno}');
      print('  - Costo total: \$${resultado.costoTotal}');
      
      // Assert
      // Cálculo esperado: 40 * 95 = 3800
      expect(
        resultado.costoPorAlumno,
        equals(95.00),
        reason: 'Con 30-49 alumnos, el costo debe ser \$95.00 por alumno',
      );
      expect(
        resultado.costoTotal,
        closeTo(3800.00, 0.01),
        reason: 'El total debe ser 40 * 95 = \$3,800.00',
      );
      
      print('✅ Prueba 4 PASADA');
    });

  });

  print('\n==================================================');
  print('FIN DE PRUEBAS - VIAJE ESCOLAR');
  print('==================================================\n');
}
