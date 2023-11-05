import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionCard extends StatefulWidget {
  const TransactionCard(
      {Key? key,
      required this.icon,
      required this.value,
      required this.category})
      : super(key: key);
  final IconData icon;
  final double value;
  final String category;
  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                widget.icon,
                color: const Color(0xFFC4161C),
                size: 40.r,
              ),
              Text(
                widget.category,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(8.r),
                child: Text(
                  '+₹${widget.value.toInt().toString()}',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }
}
