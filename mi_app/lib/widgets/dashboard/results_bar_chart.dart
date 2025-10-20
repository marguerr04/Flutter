import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ResultsBarChart extends StatelessWidget {
  const ResultsBarChart({super.key});

  
  final Color passesColor = const Color(0xFF06d6a0);
  final Color failsColor = const Color(0xFFe63946);
  final double width = 7;

  @override
  Widget build(BuildContext context) {
        final List<BarChartGroupData> barGroups = [
      //  Sangre
      makeGroupData(0, 80, 20),
      // : Orina
      makeGroupData(1, 95, 5),
      //  Colesterol
      makeGroupData(2, 60, 40),
      //  Creatinina
      makeGroupData(3, 88, 12),
      // Imagenología
      makeGroupData(4, 98, 2),
    ];


    return Container(
      height: 350,
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
          // Título y Filtro
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Resultados por Examen',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.filter_list, color: Colors.grey[400]),
            ],
          ),
          const SizedBox(height: 20),
          // Gráfico
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                barGroups: barGroups,
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 40)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: bottomTitles,
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: const FlGridData(show: true, horizontalInterval: 20),
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  
  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: passesColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: failsColor,
          width: width,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 12);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Sangre';
        break;
      case 1:
        text = 'Orina';
        break;
      case 2:
        text = 'Colest.';
        break;
      case 3:
        text = 'Creat.';
        break;
      case 4:
        text = 'Imag.';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }
}
