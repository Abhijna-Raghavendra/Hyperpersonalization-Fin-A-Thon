import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_charts/charts.dart' hide CornerStyle;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditScoreWidget extends StatefulWidget {
  const CreditScoreWidget({Key? key}) : super(key: key);

  @override
  State<CreditScoreWidget> createState() => _CreditScoreWidgetState();
}

class _CreditScoreWidgetState extends State<CreditScoreWidget> {
  //CreditScore data
  final List<_CreditData> data = [
    _CreditData('Jan', 720),
    _CreditData('Feb', 690),
    _CreditData('Mar', 710),
    _CreditData('Apr', 740),
    _CreditData('May', 660)
  ];
  double _creditscore = 0;

  //CreditScore Ranges
  final List<_CreditScoreRangeData> creditScoreRange = [
    _CreditScoreRangeData(300, 550, 'Poor'),
    _CreditScoreRangeData(550, 650, 'Average'),
    _CreditScoreRangeData(650, 750, 'Good'),
    _CreditScoreRangeData(750, 900, 'Excellent'),
  ];
  String getRangeValue() {
    for (int i = 0; i < 4; i++) {
      if (_creditscore >= creditScoreRange[i].start &&
          _creditscore < creditScoreRange[i].end) {
        return creditScoreRange[i].value;
      }
    }
    return '';
  }

  @override
  void initState() {
    _creditscore = data[4].credit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 8.h),
            child: Text(
              'Credit Score',
              style: TextStyle(fontSize: 30.sp),
              textAlign: TextAlign.left,
            ),
          ),
          ClipRect(
            child: Align(
              heightFactor: 0.72,
              alignment: Alignment.bottomCenter,
              child: SfRadialGauge(animationDuration: 3000, axes: <RadialAxis>[
                RadialAxis(
                  radiusFactor: 0.85.r,
                  canScaleToFit: true,
                  startAngle: 180,
                  endAngle: 0,
                  showLabels: false,
                  showTicks: false,
                  minimum: creditScoreRange[0].start,
                  maximum: creditScoreRange[3].end,
                  ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: creditScoreRange[0].start,
                        endValue: creditScoreRange[0].end,
                        label: creditScoreRange[0].value,
                        color: Colors.red,
                        startWidth: 30,
                        endWidth: 30),
                    GaugeRange(
                        startValue: creditScoreRange[1].start,
                        endValue: creditScoreRange[1].end,
                        label: creditScoreRange[1].value,
                        color: Colors.orange,
                        startWidth: 30,
                        endWidth: 30),
                    GaugeRange(
                        startValue: creditScoreRange[2].start,
                        endValue: creditScoreRange[2].end,
                        label: creditScoreRange[2].value,
                        color: Colors.yellow,
                        startWidth: 30,
                        endWidth: 30),
                    GaugeRange(
                        startValue: creditScoreRange[3].start,
                        endValue: creditScoreRange[3].end,
                        label: creditScoreRange[3].value,
                        color: Colors.green,
                        startWidth: 30,
                        endWidth: 30),
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
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Text(
                          _creditscore.toInt().toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 48.sp),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text('Your credit score is ${getRangeValue()}'),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Last check in ${data[4].month}',
                          style: TextStyle(fontSize: 12.sp),
                        )
                      ],
                    )),
                  ],
                )
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.h),
            child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                    axisLine: const AxisLine(width: 0),
                    labelStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFC4161C)),
                    majorGridLines: const MajorGridLines(width: 0)),
                primaryYAxis: NumericAxis(
                    axisLine: const AxisLine(width: 0),
                    minimum: creditScoreRange[0].start,
                    maximum: creditScoreRange[3].end,
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
          Center(
              child: Text(
            'Last few months Credit Score',
            style: TextStyle(fontSize: 16.sp),
          )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Credit Factors',
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Factors that affect your credit score',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 20.h),
                Card(
                  color: Colors.white70,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            color: const Color(0xFFC4161C),
                            size: 40.r,
                          ),
                          Text(
                            'On time payments',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ],
                      )),
                ),
                Card(
                  color: Colors.white70,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.wallet,
                            color: const Color(0xFFC4161C),
                            size: 40.r,
                          ),
                          Text(
                            'Credit Utilization',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ],
                      )),
                ),
                Card(
                  color: Colors.white70,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_search,
                            color: const Color(0xFFC4161C),
                            size: 40.r,
                          ),
                          Text(
                            'Hard Enquiry',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ],
                      )),
                )
              ],
            ),
          )
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

class _CreditScoreRangeData {
  _CreditScoreRangeData(this.start, this.end, this.value);

  final String value;
  final double start;
  final double end;
}
