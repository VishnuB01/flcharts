import 'package:flutter/material.dart';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KindaCode.com',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
    );
  }
}

// Define data structure for a bar group
class DataItem {
  int x;
  double y1;
  double y2;
  double y3;
  DataItem(
      {required this.x, required this.y1, required this.y2, required this.y3});
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // Generate dummy data to feed the chart
  final List<DataItem> _myData = List.generate(
      30,
          (index) =>
          DataItem(
            x: index,
            y1: Random().nextInt(20) + Random().nextDouble(),
            y2: Random().nextInt(20) + Random().nextDouble(),
            y3: Random().nextInt(20) + Random().nextDouble(),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KindaCode.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 3000,
            child: BarChart(BarChartData(
                borderData: FlBorderData(
                    border: const Border(
                      top: BorderSide.none,
                      right: BorderSide.none,
                      left: BorderSide(width: 1),
                      bottom: BorderSide(width: 1),
                    )),
                groupsSpace: 10,
                barGroups: _myData
                    .map((dataItem) =>
                    BarChartGroupData(x: dataItem.x, barRods: [
                      BarChartRodData(
                          toY: dataItem.y1, width: 15, color: Colors.amber),
                      BarChartRodData(
                          toY: dataItem.y2, width: 15, color: Colors.red),
                      BarChartRodData(
                          toY: dataItem.y3, width: 15, color: Colors.blue),
                    ]))
                    .toList())),
          ),
        ),
      ),
    );
  }
}