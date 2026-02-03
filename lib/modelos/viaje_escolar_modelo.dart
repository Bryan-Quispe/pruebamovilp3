/// Modelo para el cálculo del viaje escolar
/// Contiene los datos relacionados con el costo del viaje
class ViajeEscolarModelo {
  /// Cantidad de alumnos que participarán en el viaje
  final int cantidadAlumnos;

  /// Costo por cada alumno (puede ser 0 si es renta fija)
  final double costoPorAlumno;

  /// Costo total del viaje
  final double costoTotal;

  /// Indica si el costo es por renta fija del autobús
  final bool esRentaFija;

  /// Constructor del modelo
  ViajeEscolarModelo({
    required this.cantidadAlumnos,
    required this.costoPorAlumno,
    required this.costoTotal,
    required this.esRentaFija,
  });

  /// Obtiene la descripción del rango de alumnos
  String get descripcionRango {
    if (cantidadAlumnos >= 100) {
      return '100 o más alumnos';
    } else if (cantidadAlumnos >= 50) {
      return '50 a 99 alumnos';
    } else if (cantidadAlumnos >= 30) {
      return '30 a 49 alumnos';
    } else {
      return 'Menos de 30 alumnos';
    }
  }

  @override
  String toString() {
    return 'ViajeEscolarModelo(alumnos: $cantidadAlumnos, costoPorAlumno: \$$costoPorAlumno, total: \$$costoTotal)';
  }
}
