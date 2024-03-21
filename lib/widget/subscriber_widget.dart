import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';

import '../../services/theme/text_theme.dart';
import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';

class SubscriberWidget extends StatelessWidget {
  const SubscriberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: dark ? SColors.darkContainer : SColors.lightContainer,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
            width: 1,
            color: dark
                ? Colors.black
                : Colors.white), // Adjust border properties as needed
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('asset/logo_image/goat.jpg'),
              ),
              ),
          SizedBox(
            width: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dawit Nigus",
                    style: dark
                        ? STextTheme.darkTextTheme.headlineSmall
                        : STextTheme.lightTextTheme.headlineSmall),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      // color: Colors.black,
                      size: 16,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Addis Ababa, Ethiopia",
                      style: dark
                          ? STextTheme.darkTextTheme.bodySmall
                          : STextTheme.lightTextTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
