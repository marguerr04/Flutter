import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/ficha_medica.model.dart';

class FichasDataTable extends StatelessWidget {
  const FichasDataTable({super.key});

  @override
  Widget build(BuildContext context) {

    final List<FichaMedica> fichas = List.generate(
      15,
      (index) => FichaMedica(
        id: 'FM-2025-${1000 + index}',
        diagnosticoPrincipal: ['Hipertensión', 'Diabetes Tipo 2', 'Faringitis', 'Control Sano'][index % 4],
        fecha: DateTime.now().subtract(Duration(days: index * 10)),
        especialidad: ['Cardiología', 'Medicina General', 'Endocrinología'][index % 3],
        estado: ['Activa', 'Cerrada', 'En Proceso'][index % 3],
      ),
    );


    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: DataTable(
        columnSpacing: 20.0,
        columns: const [
          DataColumn(label: Text('ID Ficha', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Diagnóstico Principal', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Fecha', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Especialidad', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Estado', style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        rows: fichas.map((ficha) {
          return DataRow(cells: [
            DataCell(Text(ficha.id)),
            DataCell(Text(ficha.diagnosticoPrincipal)),
            DataCell(Text(DateFormat('dd/MM/yyyy').format(ficha.fecha))),
            DataCell(Text(ficha.especialidad)),
            DataCell(

              Chip(
                label: Text(ficha.estado),
                backgroundColor: _getStatusColor(ficha.estado),
                labelStyle: const TextStyle(color: Colors.white),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }

  Color _getStatusColor(String estado) {
    switch (estado) {
      case 'Activa':
        return Colors.green.shade400;
      case 'Cerrada':
        return Colors.grey.shade500;
      case 'En Proceso':
        return Colors.orange.shade400;
      default:
        return Colors.blue;
    }
  }
}
