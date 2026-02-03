import 'package:flutter/material.dart';
import '../../controladores/capicua_controlador.dart';
import '../../modelos/capicua_modelo.dart';
import '../../widgets/campo_entrada.dart';
import '../../widgets/tarjeta_resultado.dart';

/// Vista del ejercicio de Número Capicúa
/// Permite verificar si un número es capicúa (palíndromo)
class CapicuaVista extends StatefulWidget {
  const CapicuaVista({super.key});

  @override
  State<CapicuaVista> createState() => _CapicuaVistaState();
}

class _CapicuaVistaState extends State<CapicuaVista> {
  // Controlador del campo de texto
  final TextEditingController _controladorTexto = TextEditingController();
  
  // Controlador de lógica de negocio
  final CapicuaControlador _controlador = CapicuaControlador();
  
  // Clave del formulario para validación
  final GlobalKey<FormState> _claveFormulario = GlobalKey<FormState>();
  
  // Resultado de la verificación
  CapicuaModelo? _resultado;
  
  // Mostrar pasos
  bool _mostrarPasos = false;

  @override
  void dispose() {
    _controladorTexto.dispose();
    super.dispose();
  }

  /// Verifica si el número es capicúa
  void _verificar() {
    if (_claveFormulario.currentState!.validate()) {
      final numero = int.parse(_controladorTexto.text);
      setState(() {
        _resultado = _controlador.verificarCapicua(numero);
      });
    }
  }

  /// Limpia el formulario y resultados
  void _limpiar() {
    setState(() {
      _controladorTexto.clear();
      _resultado = null;
      _mostrarPasos = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Número Capicúa'),
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
                            '¿Qué es un número capicúa?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Un número capicúa (o palíndromo numérico) es aquel que se lee igual de izquierda a derecha que de derecha a izquierda.',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Ejemplos: 121, 12321, 1001, 45654',
                        style: TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Campo de entrada
              CampoEntrada(
                controlador: _controladorTexto,
                etiqueta: 'Número a verificar',
                textoAyuda: 'Ingrese un número entero positivo',
                icono: Icons.pin,
                validador: _controlador.validarNumero,
              ),
              const SizedBox(height: 24),
              // Botones
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _verificar,
                      icon: const Icon(Icons.check_circle),
                      label: const Text('Verificar'),
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
                  titulo: 'Resultado',
                  contenido: _resultado!.mensajeResultado,
                  subtitulo: 'Número original: ${_resultado!.numero}\n'
                      'Número invertido: ${_resultado!.numeroInvertido}',
                  icono: _resultado!.esCapicua
                      ? Icons.check_circle
                      : Icons.cancel,
                  esExito: _resultado!.esCapicua,
                ),
                // Botón para mostrar pasos
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _mostrarPasos = !_mostrarPasos;
                    });
                  },
                  icon: Icon(
                    _mostrarPasos
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  label: Text(
                    _mostrarPasos
                        ? 'Ocultar proceso de inversión'
                        : 'Ver proceso de inversión',
                  ),
                ),
                // Pasos de inversión
                if (_mostrarPasos) ...[
                  const SizedBox(height: 16),
                  Card(
                    color: Colors.grey[50],
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Proceso de inversión (ciclo while):',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ..._resultado!.pasosInversion.map(
                            (paso) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                paso,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'monospace',
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}
