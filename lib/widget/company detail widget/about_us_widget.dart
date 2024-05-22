import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Models/company_profile_model.dart';
import '../../services/theme/text_theme.dart';
import '../../utils/helper_function.dart';

class AboutUsWidget extends StatelessWidget {
  final CompanyProfileModel aboutus;
  const AboutUsWidget({
    Key? key,
    required this.aboutus,
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
            "About us",
            style: dark
                ? STextTheme.darkTextTheme.headlineSmall
                : STextTheme.lightTextTheme.headlineSmall,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            aboutus.description,
            style: dark
                ? STextTheme.darkTextTheme.titleMedium
                : STextTheme.lightTextTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
