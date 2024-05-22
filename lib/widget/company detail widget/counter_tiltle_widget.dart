import 'package:flutter/material.dart';
import 'package:ssen_company/utils/constants.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helper_function.dart';

class CounterItem extends StatelessWidget {
  final String values;
  final String name;
  final IconData icon;

  const CounterItem({
    Key? key,
    required this.values,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: dark ? SColors.darkContainer : SColors.lighGrey,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                width: 1.5,
                color: Colors.grey), // Adjust border properties as needed
          ),
          child: SizedBox(
            width: 109,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Icon(
                    icon,
                    size: 34,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    values,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
          child: Text(
            name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}
