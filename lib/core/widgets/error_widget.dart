import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/media_query_values.dart';

class CustomErrorWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomErrorWidget(
     {
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning_rounded,
            color: AppColors.primaryColor,
            size: 150,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: const Text(
            AppStrings.errorPageOne,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Text(
          AppStrings.plzTryAgain,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          height: 55,
          width: context.width * 0.55,
          child: ElevatedButton(
            onPressed: () {
              if (onPressed != null) {
                onPressed!();
              }
            },
            style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: AppColors.primaryColor,
                elevation: 500,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: const Text(
              AppStrings.reloadScreen,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
