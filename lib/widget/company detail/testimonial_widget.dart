import 'package:flutter/material.dart';


import '../../services/theme/text_theme.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_Strings.dart';
import '../../utils/constants/size.dart';
import '../../utils/helper_function.dart';

class HorizontalScrollableTestimonial extends StatelessWidget {
  final List<ScrollableItem> items = [
    ScrollableItem(
      image: SImages.empolyee1,
      title: 'Wubet Ayalew',
      authority: 'CEO',
      description:
          'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
    ),
    
    ScrollableItem(
      image: SImages.employee2,
      title: 'Birhan Mulugeta',
      authority: 'CEO',
      description:
          'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
    ),

    ScrollableItem(
      image: SImages.employee3,
      title: 'Director ',
      authority: 'CEO',
      description:
          'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
    ),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Testimonials",
            style: dark
                ? STextTheme.darkTextTheme.headlineSmall
                : STextTheme.lightTextTheme.headlineSmall,
          ),
          const SizedBox(
            height: SSizes.iconXS,
          ),
          SizedBox(
            height: 200,
            child: Scrollbar(
         
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ScrollableListItem(item: items[index]);
                },
              ),
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
  final String authority;

  ScrollableItem(
      {required this.image,
      required this.title,
      required this.description,
      required this.authority});
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
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
            width: 1, color: Colors.grey), // Adjust border properties as needed
      ),
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: SColors.primaryColor, // Set the background color to blue
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(item.image),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      item.title,
                      
                      style: dark
                          ? STextTheme.darkTextTheme.headlineSmall
                          : STextTheme.lightTextTheme.headlineSmall,
                    ),
                    Text(
                      item.authority,
                      style: dark
                          ? STextTheme.darkTextTheme.titleMedium
                          : STextTheme.lightTextTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            item.description,
            maxLines:
                620, // Adjust the number of lines you want to show initially
            overflow: TextOverflow.ellipsis,
            style: dark
                ? STextTheme.darkTextTheme.bodySmall
                : STextTheme.lightTextTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
