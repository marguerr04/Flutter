import 'package:flutter/material.dart';
import '../widgets/layout/admin_sidebar.dart'; // Importamos nuestro componente
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Row(
      children: [
        // Sidebar - 20% del ancho
        Expanded(
          flex: 2, 
          child: AdminSidebar(
            selectedIndex: 0,
            onItemSelected: (index) {

              print('Índice seleccionado: $index');
              

              if (index == 0) {
                 print('Ya estás en Dashboard General');
              } else if (index == 1) {
                Navigator.pushNamed(context, '/fichas');
              } else if (index == 2) {

                Navigator.pushReplacementNamed(context, '/login');
              }
            // Futuros indices
            },
          ),
        ),
        //  80% del ancho  
        Expanded(
          flex: 8, 
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dashboard Medico', style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/perfil'),
                  child: Text('Ir al Perfil'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cerrar sesión'),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
}
