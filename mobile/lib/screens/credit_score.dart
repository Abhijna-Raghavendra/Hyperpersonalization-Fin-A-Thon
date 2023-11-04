import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/UI/appbar.dart';

class CreditScreen extends StatefulWidget {
  const CreditScreen({Key? key}) : super(key: key);

  @override
  State<CreditScreen> createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  List<_CreditData> data = [
    _CreditData('Jan', 720),
    _CreditData('Feb', 690),
    _CreditData('Mar', 710),
    _CreditData('Apr', 740),
    _CreditData('May', 660)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(preferredSize: Size.fromHeight(70)),
      body: SingleChildScrollView(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/chat');
        },
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFFC4161C),
        child: const FaIcon(FontAwesomeIcons.robot),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        iconSize: 20.r,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user), label: 'profile'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.wallet), label: 'payments'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.gaugeHigh), label: 'credit score'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.lightbulb), label: 'insights'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.gift), label: 'offers'),
        ],
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color(0xFFC4161C),
      ),
    );
  }
}

class _CreditData {
  _CreditData(this.month, this.credit);

  final String month;
  final double credit;
}
