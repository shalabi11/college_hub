// import 'package:college_hub/constant.dart';
import 'package:college_hub/core/styles.dart';
import 'package:flutter/material.dart';

class CardForStudentSchedule extends StatelessWidget {
  CardForStudentSchedule({super.key, this.isRead = false});
  bool isRead;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          isRead = true;
        },
        child: Card(
          elevation: 10,
          color: Theme.of(context).cardColor,
          margin: EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Text(
                  'مقدمة في البرمجة ',
                  style: Styles.textStyle20.copyWith(
                    // color: kTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '10:00 ص - 11:30 ص',
                    style: Styles.textStyle14.copyWith(
                      // color: kTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'القاعة 6 - د.محمد',
                  style: Styles.textStyle14.copyWith(
                    // color: kTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
