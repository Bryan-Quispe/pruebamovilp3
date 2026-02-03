import '../modelos/viaje_escolar_modelo.dart';

/// Controlador para el cálculo del viaje escolar
/// Contiene la lógica de negocio para determinar costos
class ViajeEscolarControlador {
  // Constantes de precios
  static const double _precioPor100OMas = 65.00;
  static const double _precioPor50A99 = 70.00;
  static const double _precioPor30A49 = 95.00;
  static const double _rentaFijaAutobus = 4000.00;

  /// Calcula el costo del viaje según la cantidad de alumnos
  /// Utiliza condicionales para determinar el precio aplicable
  /// 
  /// Reglas:
  /// - 100+ alumnos: $65.00 por alumno
  /// - 50-99 alumnos: $70.00 por alumno
  /// - 30-49 alumnos: $95.00 por alumno
  /// - <30 alumnos: $4,000.00 renta fija
  ViajeEscolarModelo calcularCosto(int cantidadAlumnos) {
    double costoPorAlumno;
    double costoTotal;
    bool esRentaFija = false;

    // Uso de condicionales para determinar el costo
    if (cantidadAlumnos >= 100) {
      // 100 o más alumnos
      costoPorAlumno = _precioPor100OMas;
      costoTotal = cantidadAlumnos * costoPorAlumno;
    } else if (cantidadAlumnos >= 50) {
      // De 50 a 99 alumnos
      costoPorAlumno = _precioPor50A99;
      costoTotal = cantidadAlumnos * costoPorAlumno;
    } else if (cantidadAlumnos >= 30) {
      // De 30 a 49 alumnos
      costoPorAlumno = _precioPor30A49;
      costoTotal = cantidadAlumnos * costoPorAlumno;
    } else {
      // Menos de 30 alumnos - renta fija
      esRentaFija = true;
      costoPorAlumno = cantidadAlumnos > 0 
          ? _rentaFijaAutobus / cantidadAlumnos 
          : 0;
      costoTotal = _rentaFijaAutobus;
    }

    return ViajeEscolarModelo(
      cantidadAlumnos: cantidadAlumnos,
      costoPorAlumno: costoPorAlumno,
      costoTotal: costoTotal,
      esRentaFija: esRentaFija,
    );
  }

  /// Valida que la cantidad de alumnos sea válida
  String? validarCantidad(String? valor) {
    if (valor == null || valor.isEmpty) {
      return 'Por favor ingrese la cantidad de alumnos';
    }

    final numero = int.tryParse(valor);
    if (numero == null) {
      return 'Por favor ingrese un número válido';
    }

    if (numero <= 0) {
      return 'La cantidad debe ser mayor a 0';
    }

    return null;
  }

  /// Obtiene el precio por alumno según el rango
  /// Útil para mostrar información sin calcular
  double obtenerPrecioPorRango(int cantidad) {
    if (cantidad >= 100) return _precioPor100OMas;
    if (cantidad >= 50) return _precioPor50A99;
    if (cantidad >= 30) return _precioPor30A49;
    return _rentaFijaAutobus;
  }
}
