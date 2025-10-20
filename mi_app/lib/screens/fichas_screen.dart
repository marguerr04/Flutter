import 'package:flutter/material.dart';
import '../widgets/layout/admin_sidebar.dart'; // Importamos nuestro componente

class FichasScreen extends StatelessWidget {
  const FichasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row( 
        children: [
 

          Expanded(
          flex: 2, 
          child: AdminSidebar(
            selectedIndex: 1,
            onItemSelected: (index) {
              print('Índice seleccionado: $index');
              
              if (index == 0) {
                Navigator.pushNamed(context, '/dashboard');
              } else if (index == 1) {
                print('Ya estás en Fichas Médicas');
              } else if (index == 2) {
         
                Navigator.pushReplacementNamed(context, '/login');
              }
            
            },
          ),
        ),


          Expanded(
            flex: 8,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.folder_copy, size: 100, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    'Pantalla de Fichas Médicas',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Aquí se mostrará la lista de fichas, filtros, etc.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
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
