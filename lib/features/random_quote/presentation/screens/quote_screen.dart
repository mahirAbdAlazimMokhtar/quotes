import 'package:flutter/material.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/constants.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
              onTap: () {
                AppConstants.showToast(
              
                  msg: 'Hi This For Test',
                  color: Colors.red,
                  );
              },
              child: Image.asset(ImageAssets.quoteImg))),
    );
  }
}
