import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('통계'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: PieChart(
                  PieChartData(sections: [
                    PieChartSectionData(value: 10, color: Colors.red),
                    PieChartSectionData(value: 10, color: Colors.green),
                    PieChartSectionData(value: 10, color: Colors.blue),
                  ]
                      // read about it in the PieChartData section
                      ),
                  swapAnimationDuration: const Duration(
                    milliseconds: 150,
                  ), // Optional
                  swapAnimationCurve: Curves.linear, // Optional
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
