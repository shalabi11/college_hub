import 'package:college_hub/core/styles.dart';
import 'package:college_hub/views/doctors_views/send_not_view.dart';
import 'package:college_hub/widgets/card_dor_ads_emp.dart';

import 'package:flutter/material.dart';

class AdsView extends StatelessWidget {
  const AdsView({super.key});
  static String id = 'ads view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('إدارة الإعلانات', style: Styles.textStyle20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SendNotView.id);
                  },
                  child: Text('+ اعلان جدبد '),
                ),
              ],
            ),

            CardForAdsEmp(),
            CardForAdsEmp(),
            CardForAdsEmp(),
            CardForAdsEmp(),
            CardForAdsEmp(),
            CardForAdsEmp(),
            CardForAdsEmp(),
          ],
        ),
      ),
    );
  }
}
