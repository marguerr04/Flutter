import 'package:flutter/material.dart';
import '../widgets/layout/admin_sidebar.dart'; // Importamos nuestro componente

class FichasScreen extends StatelessWidget {
  const FichasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // No usamos AppBar porque la navegación está en el sidebar
      body: Row( // Usamos una Fila para la disposición horizontal
        children: [
          // 1. A la izquierda, colocamos nuestro componente reutilizable

          Expanded(
          flex: 2, // 20% del total
          child: AdminSidebar(
            selectedIndex: 1,
            onItemSelected: (index) {
              print('Índice seleccionado: $index');
              
              // Ejemplo de navegación:
              if (index == 0) {
                Navigator.pushNamed(context, '/dashboard');
              } else if (index == 1) {
                // imprimir en consola que ya estamos en fichas
                print('Ya estás en Fichas Médicas');
              } else if (index == 2) {
                // cerrar sesion a /login
                Navigator.pushReplacementNamed(context, '/login');
              }
            // Futuros indices
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
