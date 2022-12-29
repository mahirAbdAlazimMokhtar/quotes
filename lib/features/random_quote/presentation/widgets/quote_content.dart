import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
              style:Theme.of(context).textTheme.titleSmall,
              "text Theme text Theme text Theme text Theme"),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Text('Mahir',
            style:Theme.of(context).textTheme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }
}
