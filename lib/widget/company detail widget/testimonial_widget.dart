import 'package:flutter/material.dart';
import 'package:ssen_company/Models/testimonial_model.dart';
import 'package:ssen_company/services/theme/text_theme.dart';
import 'package:ssen_company/utils/helper_function.dart';

import '../../utils/constants/colors.dart';

class TestimonialWidget extends StatelessWidget {
  final TestimonialModel testimonial;

  const TestimonialWidget({required this.testimonial});

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
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: SColors.primaryColor, // Set the background color to blue
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(testimonial.image[0]),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      testimonial.name,
                      style: dark
                          ? STextTheme.darkTextTheme.headlineSmall
                          : STextTheme.lightTextTheme.headlineSmall,
                    ),
                    Text(
                      testimonial.position,
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
            testimonial.testimony,
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
