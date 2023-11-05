import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/UI/transaction_card.dart';
import 'package:mobile/utils/get_expenses.dart';
import 'package:mobile/utils/model_definitions.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);
  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late Future<ExpenseData> exp1, exp2, exp3, exp4;

  @override
  void initState() {
    exp1 = fetchExpenses('1');
    exp2 = fetchExpenses('2');
    exp3 = fetchExpenses('3');
    exp4 = fetchExpenses('4');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              24.h,
              15.h,
              24.h,
              0,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 130.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/profile_img.png'),
                      fit: BoxFit.fitWidth)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Username',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 15.h),
            child:
                const Image(image: AssetImage('assets/images/quick_links.png')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 15.h),
            child: Text(
              'Transaction history',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder<ExpenseData>(
            future: exp1,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.h),
                  child: TransactionCard(
                      icon: Icons.monetization_on,
                      value: snapshot.data!.expense,
                      category: snapshot.data!.category),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
          FutureBuilder<ExpenseData>(
            future: exp2,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.h),
                  child: TransactionCard(
                      icon: Icons.monetization_on,
                      value: snapshot.data!.expense,
                      category: snapshot.data!.category),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
          FutureBuilder<ExpenseData>(
            future: exp3,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.h),
                  child: TransactionCard(
                      icon: Icons.monetization_on,
                      value: snapshot.data!.expense,
                      category: snapshot.data!.category),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
          FutureBuilder<ExpenseData>(
            future: exp4,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.h),
                  child: TransactionCard(
                      icon: Icons.monetization_on,
                      value: snapshot.data!.expense,
                      category: snapshot.data!.category),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 15.h),
            child: const Image(
                image: AssetImage('assets/images/recharge_bills.png')),
          ),
        ],
      ),
    );
  }
}
