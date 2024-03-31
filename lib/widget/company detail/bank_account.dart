
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/size.dart';
import '../../utils/helper_function.dart';

class verticlScrollableBankAccount extends StatelessWidget {
 
 @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Container(
       height: 120,
       width: double.infinity,
        
        
        decoration: BoxDecoration(
          color: dark ? SColors.darkContainer : SColors.lightContainer,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              width: 1, color: Colors.grey), // Adjust border properties as needed
        ),
        child: Column(
          children: [
            Text("CBE",
                style: dark
                    ? STextTheme.darkTextTheme.headlineSmall
                    : STextTheme.lightTextTheme.headlineSmall),
            Text(
              maxLines:
                  2, // Adjust the number of lines you want to show initially
              overflow: TextOverflow.ellipsis,
             '100002970199992' ,
              style: dark
                  ? STextTheme.darkTextTheme.bodySmall
                  : STextTheme.lightTextTheme.bodySmall,
            ),
            Text(
              maxLines:
                  2, // Adjust the number of lines you want to show initially
              overflow: TextOverflow.ellipsis,
              '100002970199992' ,
              style: dark
                  ? STextTheme.darkTextTheme.bodySmall
                  : STextTheme.lightTextTheme.bodySmall,
            ),
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.delete,
                color: Colors.red,
              ),
              Icon(
                Icons.edit,
                color: Colors.green,
              ),
            ],
          )
          ],
        ),
      ),
    );
  }
}
