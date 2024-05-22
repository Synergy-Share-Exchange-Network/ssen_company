import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/helper_function.dart';

class MissionWidget extends StatelessWidget {
  final String title;
  final String description;
  const MissionWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      width: 150.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: dark
                ? STextTheme.darkTextTheme.headlineSmall
                : STextTheme.lightTextTheme.headlineSmall,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            description,
            style: dark
                ? STextTheme.darkTextTheme.titleMedium
                : STextTheme.lightTextTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
