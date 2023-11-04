import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InsightsWidget extends StatelessWidget {
  const InsightsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<_SpendingSplit> _spendingSplit = [
      _SpendingSplit('Bills', const Color(0xFFFFAFAF), 10000),
      _SpendingSplit('Food', const Color(0xFFFF8C8C), 2000),
      _SpendingSplit('Grocery', const Color(0xFFFF6968), 1200),
      _SpendingSplit('Education', const Color(0xFFFF4646), 1000),
      _SpendingSplit('Travel', const Color(0xFFFF2323), 2000),
      _SpendingSplit('Other', const Color(0xFFC4161C), 800),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24.h,15.h, 24.h,0,),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 130.h,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/profile_img.png'),fit: BoxFit.fitWidth)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Current Balance', style: TextStyle(color: Colors.white, fontSize: 20.sp),),
                    Text('+₹ 1,00,000', style: TextStyle(color: Colors.white, fontSize: 28.sp, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 5.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: Colors.white70,
                  child: SizedBox(
                      width: 145.h,
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.r),
                              child: Icon(
                                Icons.input,
                                color: Colors.lightGreen,
                                size: 20.r,
                              ),
                            ),
                            Text(
                              'Income',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              '+₹ 50,000',
                              style: TextStyle(
                                  fontSize: 24.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                ),
                Card(
                  color: Colors.white70,
                  child: SizedBox(
                      width: 145.h,
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.r),
                              child: Icon(
                                Icons.output,
                                color: Colors.red,
                                size: 20.r,
                              ),
                            ),
                            Text(
                              'Spendings',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              '-₹ 35,000',
                              style: TextStyle(
                                  fontSize: 24.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
            child: Card(
              color: Colors.white70,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.all(12.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                            color: Colors.white54,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: Text(
                                'Spendings',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        SfCircularChart(
                            legend: Legend(
                                position: LegendPosition.bottom,
                                isVisible: true),
                            series: <DoughnutSeries<_SpendingSplit, String>>[
                              DoughnutSeries<_SpendingSplit, String>(
                                  explode: true,
                                  explodeIndex: 0,
                                  dataSource: _spendingSplit,
                                  xValueMapper: (_SpendingSplit data, _) => data.category,
                                  yValueMapper: (_SpendingSplit data, _) => data.value,
                                  pointColorMapper: (_SpendingSplit data, _) => data.color,
                                  dataLabelMapper: (_SpendingSplit data, _) => data.category,
                                dataLabelSettings: const DataLabelSettings(isVisible: true)
                              ),
                            ]
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpendingSplit {
  _SpendingSplit(this.category, this.color, this.value);

  final String category;
  final Color color;
  final double value;
}
