import 'package:flutter/material.dart';
import '../widgets/layout/admin_sidebar.dart';
// 1. Importa tu nuevo widget de gráfico
import '../widgets/dashboard/analyte_line_chart.dart'; 

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Un fondo suave para la página
      body: Row(
        children: [
          // Sidebar (El tuyo ya tiene la lógica de navegación)
          AdminSidebar(
            selectedIndex: 0,
            onItemSelected: (index) {
              if (index == 1) {
                Navigator.pushNamed(context, '/fichas');
              } else if (index == 2) {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          ),
          
          // --- CONTENIDO PRINCIPAL DEL DASHBOARD ---
          Expanded(
            flex: 8,
            child: SingleChildScrollView( // Usamos SingleChildScrollView para evitar overflows
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Dashboard Médico',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24),

                  // 2. Aquí colocamos nuestro nuevo componente de gráfico
                  AnalyteLineChart(),
                  
                  SizedBox(height: 24),
                  
                  // Aquí podrías añadir más gráficos o tarjetas en el futuro
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

