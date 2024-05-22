import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ssen_company/Models/why_invest.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/helper_function.dart';

class WhyYouInvestWidget extends StatelessWidget {
  final WhyInvestModel whyinvest;

  WhyYouInvestWidget({
    required this.whyinvest,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      width: 400,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
            width: 1, color: Colors.grey), // Adjust border properties as needed
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(whyinvest.title,
              style: dark
                  ? STextTheme.darkTextTheme.headlineSmall
                  : STextTheme.lightTextTheme.headlineSmall),
          Text(
            maxLines:
                10, // Adjust the number of lines you want to show initially
            overflow: TextOverflow.ellipsis,
            whyinvest.description,
            style: dark
                ? STextTheme.darkTextTheme.bodySmall
                : STextTheme.lightTextTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
