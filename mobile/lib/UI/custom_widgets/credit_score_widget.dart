import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class CreditScoreWidget extends StatefulWidget {
  const CreditScoreWidget({Key? key}) : super(key: key);

  @override
  State<CreditScoreWidget> createState() => _CreditScoreWidgetState();
}

class _CreditScoreWidgetState extends State<CreditScoreWidget> {
  final List<_CreditData> data= [
    _CreditData('Jan', 720),
    _CreditData('Feb', 690),
    _CreditData('Mar', 710),
    _CreditData('Apr', 740),
    _CreditData('May', 660)
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SfRadialGauge(
                title: const GaugeTitle(
                    alignment: GaugeAlignment.near,
                    text: 'Credit Score',
                    textStyle: TextStyle(fontSize: 30)),
                animationDuration: 3000,
                axes: <RadialAxis>[
                  RadialAxis(
                    canScaleToFit: true,
                    startAngle: 180,
                    endAngle: 0,
                    showLabels: false,
                    showTicks: false,
                    minimum: 300,
                    maximum: 850,
                    ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 300,
                          endValue: 580,
                          color: Colors.red,
                          startWidth: 40,
                          endWidth: 40),
                      GaugeRange(
                          startValue: 580,
                          endValue: 670,
                          color: Colors.orange,
                          startWidth: 40,
                          endWidth: 40),
                      GaugeRange(
                          startValue: 670,
                          endValue: 740,
                          color: Colors.yellow,
                          startWidth: 40,
                          endWidth: 40),
                      GaugeRange(
                          startValue: 740,
                          endValue: 800,
                          color: Colors.lightGreenAccent,
                          startWidth: 40,
                          endWidth: 40),
                      GaugeRange(
                          startValue: 800,
                          endValue: 850,
                          color: Colors.green,
                          startWidth: 40,
                          endWidth: 40)
                    ],
                    pointers: const <GaugePointer>[
                      MarkerPointer(
                        enableAnimation: true,
                        color: Colors.black,
                        markerHeight: 15,
                        markerWidth: 15,
                        markerType: MarkerType.invertedTriangle,
                        markerOffset: -15,
                        value: 660,
                      )
                    ],
                    annotations: [
                      GaugeAnnotation(
                          widget: Column(
                            children: const [
                              SizedBox(
                                height: 80,
                              ),
                              Text(
                                '660',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 48),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Your credit score is average'),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Last check on 20 Aug',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )),
                    ],
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 50),
            child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                    labelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC4161C)),
                    majorGridLines: const MajorGridLines(width: 0)),
                primaryYAxis: NumericAxis(
                    minimum: 300,
                    maximum: 850,
                    labelStyle:
                    const TextStyle(fontSize: 14, color: Color(0xFFC4161C)),
                    majorGridLines: const MajorGridLines(width: 0)),
                legend: Legend(isVisible: false),
                tooltipBehavior: TooltipBehavior(enable: true),
                enableAxisAnimation: true,
                series: <ChartSeries<_CreditData, String>>[
                  LineSeries<_CreditData, String>(
                    color: const Color(0xFFC4161C),
                    width: 5,
                    markerSettings: const MarkerSettings(
                        color: Color(0xFFC4161C), isVisible: true),
                    dataSource: data,
                    xValueMapper: (_CreditData credit, _) => credit.month,
                    yValueMapper: (_CreditData credit, _) => credit.credit,
                    name: 'Credit Score',
                    //dataLabelSettings: const DataLabelSettings(isVisible: true)
                  )
                ]),
          ),
        ],
      ),
    );
  }
}

class _CreditData {
  _CreditData(this.month, this.credit);

  final String month;
  final double credit;
}
