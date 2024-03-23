import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_company/services/theme/text_theme.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_Strings.dart';
import '../../utils/constants/size.dart';
import '../../utils/helper_function.dart';

class EditTestimonial extends StatelessWidget {
  final String title;
  const EditTestimonial({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return GestureDetector(
            onTap:  (){
               Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  EditAddTestimonial()), // Replace ShareholderDetailPage() with your actual detail page
        );
            },
             child: Container(
                 height: 60,
                 width: MediaQuery.of(context).size.width,
                 margin: EdgeInsets.all(5),
                 decoration: BoxDecoration(
                   color: dark ? SColors.darkContainer : SColors.lightContainer,
                    // borderRadius: BorderRadius.circular(14),
                   borderRadius: BorderRadius.circular(14),
                   border: Border.all(
              width: 1,
              color: dark
                  ? Colors.black
                  : SColors.darkeGery), // Adjust border properties as needed
                 ),
                 child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("  $title",
                     style:dark? STextTheme.darkTextTheme.titleLarge :STextTheme.lightTextTheme.titleLarge,
                     ),
                     Icon(Icons.edit,
                      size: 25, 
                     )
                   ],
                 ),
                 
                 ),
           );
    
  }
}
class EditAddTestimonial extends StatelessWidget {
  const EditAddTestimonial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerticalScrollableTestimonial(),
    );
    
  }
}



class VerticalScrollableTestimonial extends StatelessWidget {
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
          'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
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
    return SingleChildScrollView(
      child: Column(
        children: items.map((item) => ScrollableListItem(item: item)).toList(),
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
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      width: double.infinity, // Expand container to full width
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: SColors.primaryColor,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(item.image),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: 8),
          Text(
            item.description,
            style: dark
                ? STextTheme.darkTextTheme.bodySmall
                : STextTheme.lightTextTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}


class VerticalListViewBuilderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vertical ListView Builder Example'),
      ),
      body: ListView.builder(
        itemCount: 20, // Number of items in the list
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
            subtitle: Text('Description of Item $index'),
            leading: CircleAvatar(
              child: Text('$index'),
            ),
            onTap: () {
              // Action when item is tapped
              print('Item $index tapped');
            },
          );
        },
      ),
    );
  }
}

