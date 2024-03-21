
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants/image_Strings.dart';
import '../../utils/constants/size.dart';
import '../../utils/helper_function.dart';

class HorizontalScrollableEmployeeList extends StatelessWidget {
  final List<ScrollableItem> items = [
    ScrollableItem(
      image: SImages.empolyee1,
      title: 'CEO',
      description: 'Manage and control 1',
    ),
    ScrollableItem(
      image: SImages.employee2,
      title: 'Supervisor',
      description: 'Description 2',
    ),

    ScrollableItem(
      image: SImages.employee3,
      title: 'Director ',
      description: 'Description 2',
    ),
    // Add more items as needed
  ];

  @override
 Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Key Figures",
              style: dark
                  ? STextTheme.darkTextTheme.headlineSmall
                  : STextTheme.lightTextTheme.headlineSmall,
            ),
          ),
          SizedBox(
            height: SSizes.iconXS,
          ),
          Container(
            height: 180.0,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ScrollableListItem(item: items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollableItem {
  final String image;
  final String title;
  final String description;

  ScrollableItem(
      {required this.image, required this.title, required this.description});
}

class ScrollableListItem extends StatelessWidget {
  final ScrollableItem item;

  ScrollableListItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return ScrollableItemWidget(item: item);
  }
}

class ScrollableItemWidget extends StatelessWidget {
  final ScrollableItem item;

  ScrollableItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(8.0),
      //   border: Border.all(color: Colors.black),
      // ),
      width: 150.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage(item.image),
          ),
          SizedBox(height: 8.0),
          Text(
            item.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.blue),
          ),
          SizedBox(height: 4.0),
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
