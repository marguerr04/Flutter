import 'package:flutter/material.dart';
import '../widgets/layout/admin_sidebar.dart';
import '../widgets/dashboard/analyte_line_chart.dart';
import '../widgets/dashboard/results_bar_chart.dart'; 

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], 
      body: Row(
        children: [
          // Sidebar 
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
          

          Expanded(
            flex: 8, 
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dashboard Médico',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),


                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 900) {
                        return Column(
                          children: const [
                            AnalyteLineChart(),
                            SizedBox(height: 24),
                            ResultsBarChart(),
                          ],
                        );
                      }
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Expanded(child: AnalyteLineChart()),
                          SizedBox(width: 24),
                          Expanded(child: ResultsBarChart()),
                        ],
                      );
                    },
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

