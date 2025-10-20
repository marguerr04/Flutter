class FichaMedica {
  final String id;
  final String diagnosticoPrincipal;
  final DateTime fecha;
  final String especialidad;
  final String estado;

  FichaMedica({
    required this.id,
    required this.diagnosticoPrincipal,
    required this.fecha,
    required this.especialidad,
    required this.estado,
  });
}
