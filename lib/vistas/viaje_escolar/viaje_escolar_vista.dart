import 'package:flutter/material.dart';
import '../../controladores/viaje_escolar_controlador.dart';
import '../../modelos/viaje_escolar_modelo.dart';
import '../../widgets/campo_entrada.dart';
import '../../widgets/tarjeta_resultado.dart';

/// Vista del ejercicio de Viaje Escolar
/// Permite calcular el costo según la cantidad de alumnos
class ViajeEscolarVista extends StatefulWidget {
  const ViajeEscolarVista({super.key});

  @override
  State<ViajeEscolarVista> createState() => _ViajeEscolarVistaState();
}

class _ViajeEscolarVistaState extends State<ViajeEscolarVista> {
  // Controlador del campo de texto
  final TextEditingController _controladorTexto = TextEditingController();
  
  // Controlador de lógica de negocio
  final ViajeEscolarControlador _controlador = ViajeEscolarControlador();
  
  // Clave del formulario para validación
  final GlobalKey<FormState> _claveFormulario = GlobalKey<FormState>();
  
  // Resultado del cálculo
  ViajeEscolarModelo? _resultado;

  @override
  void dispose() {
    _controladorTexto.dispose();
    super.dispose();
  }

  /// Calcula el costo del viaje
  void _calcular() {
    if (_claveFormulario.currentState!.validate()) {
      final cantidad = int.parse(_controladorTexto.text);
      setState(() {
        _resultado = _controlador.calcularCosto(cantidad);
      });
    }
  }

  /// Limpia el formulario y resultados
  void _limpiar() {
    setState(() {
      _controladorTexto.clear();
      _resultado = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viaje Escolar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _claveFormulario,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Descripción del ejercicio
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Descripción',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Calcula el costo del viaje de estudios según las siguientes reglas:',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      _construirRegla('100+ alumnos', '\$65.00 c/u'),
                      _construirRegla('50-99 alumnos', '\$70.00 c/u'),
                      _construirRegla('30-49 alumnos', '\$95.00 c/u'),
                      _construirRegla('<30 alumnos', '\$4,000.00 (renta fija)'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Campo de entrada
              CampoEntrada(
                controlador: _controladorTexto,
                etiqueta: 'Cantidad de alumnos',
                textoAyuda: 'Ingrese el número de alumnos',
                icono: Icons.people,
                validador: _controlador.validarCantidad,
              ),
              const SizedBox(height: 24),
              // Botones
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _calcular,
                      icon: const Icon(Icons.calculate),
                      label: const Text('Calcular'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _limpiar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.grey[700],
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 24,
                      ),
                    ),
                    child: const Icon(Icons.refresh),
                  ),
                ],
              ),
              // Resultado
              if (_resultado != null) ...[
                TarjetaResultado(
                  titulo: 'Costo Total del Viaje',
                  contenido: '\$${_resultado!.costoTotal.toStringAsFixed(2)}',
                  subtitulo: _resultado!.descripcionRango,
                  icono: Icons.attach_money,
                  esExito: true,
                  detalles: [
                    'Cantidad de alumnos: ${_resultado!.cantidadAlumnos}',
                    if (_resultado!.esRentaFija)
                      'Tipo: Renta fija de autobús'
                    else
                      'Costo por alumno: \$${_resultado!.costoPorAlumno.toStringAsFixed(2)}',
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// Construye una fila de regla de precio
  Widget _construirRegla(String rango, String precio) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          const Icon(Icons.arrow_right, size: 16, color: Colors.grey),
          Text(
            '$rango: ',
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            precio,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF10B981),
            ),
          ),
        ],
      ),
    );
  }
}
