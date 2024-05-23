import 'package:flutter/material.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/size.dart';
import '../../utils/helper_function.dart';

class ExpandableAboutUsText extends StatefulWidget {
  final String text;

  ExpandableAboutUsText({required this.text});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableAboutUsText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "About us",
              style: dark
                  ? STextTheme.darkTextTheme.headlineSmall
                  : STextTheme.lightTextTheme.headlineSmall,
            ),
          ),
          const SizedBox(
            height: SSizes.iconXS,
          ),
          Text(
            widget.text,
            maxLines:
                3, // Adjust the number of lines you want to show initially
            overflow: TextOverflow.ellipsis,
            style: dark
                ? STextTheme.darkTextTheme.bodySmall
                : STextTheme.lightTextTheme.bodySmall,
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 35,
              child: ElevatedButton(onPressed: () {}, child: Text('View All'))),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
