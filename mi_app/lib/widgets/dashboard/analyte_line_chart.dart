import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyteLineChart extends StatelessWidget {
  const AnalyteLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    // --- DATOS SIMULADOS ---
    // Rango normal para la glucosa (ej. 70-110 mg/dL)
    const double normalRangeMin = 70.0;
    const double normalRangeMax = 110.0;

    // Lista de puntos de datos (valor X representa el mes, valor Y es el resultado)
    final List<FlSpot> spots = [
      FlSpot(1, 85),  // Enero
      FlSpot(2, 95),  // Febrero
      FlSpot(3, 115), // Marzo (fuera de rango)
      FlSpot(4, 105), // Abril
      FlSpot(5, 125), // Mayo (fuera de rango)
      FlSpot(6, 110), // Junio
    ];
    // --- FIN DE DATOS SIMULADOS ---

    return Container(
      height: 350, // Un poco más de altura para que se vea bien
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Evolución de Glucosa (mg/dL)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.filter_list, color: Colors.grey[400]), // Icono decorativo
            ],
          ),
          const SizedBox(height: 20),
          // Gráfico
          Expanded(
            child: LineChart(
              LineChartData(

                lineTouchData: const LineTouchData(enabled: false),
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: normalRangeMin,
                      color: const Color(0x33a8e6a1),
                      strokeWidth: 50, // Ancho de sombra
                    ),
                  ]
                ),

                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: const Color(0xFF007bff), 
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 5,
                          color: (spot.y > normalRangeMax || spot.y < normalRangeMin)
                              ? const Color(0xFFFF4C4C) // Rojo si está fuera de rango
                              : const Color(0xFF007bff).withOpacity(0.5), // Azul si está dentro
                          strokeWidth: 0,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
                
                titlesData: const FlTitlesData(
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 40)),
                  bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 30)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: const FlGridData(show: true, horizontalInterval: 20),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xffe7e7e7), width: 1),
                ),
                minY: 50, 
                maxY: 150, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}

