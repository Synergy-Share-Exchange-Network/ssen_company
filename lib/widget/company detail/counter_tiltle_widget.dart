import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_company/utils/constants.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helper_function.dart';


class HorizontalScrollableCounter extends StatelessWidget {
  final List<CounterItem> items = [
    CounterItem(values: '1000+', name: 'Shares', icon: Icons.shopping_cart),
    CounterItem(values: '100+', name: 'Subscriber', icon: Icons.people),

    CounterItem(values: '1000+', name: 'Capital', icon: Icons.money),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 120.0, // Adjust the height as needed
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return CounterTitle(item: items[index]);
          },
        ),
      ),
    );
  }
}

class CounterItem {
  final String values;
  final String name;
  final IconData icon;

  CounterItem({required this.values, required this.name, required this.icon});
}

class CounterTitle extends StatelessWidget {
  final CounterItem item;

  const CounterTitle({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Row(
    crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
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
                        item.icon,
                        size: 34,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item.values,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
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
                item.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            
          ],
        ),
        MediaQuery.of(context).size.width > phoneSize ?
    SizedBox(width: 300,) :SizedBox(width: 150,)
      ],
    );
  }
}
