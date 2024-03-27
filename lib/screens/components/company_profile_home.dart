import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


import '../../services/theme/text_theme.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_Strings.dart';
import '../../utils/helper_function.dart';
import '../../widget/company detail/counter_tiltle_widget.dart';
import '../../widget/company detail/description_widget.dart';
import '../../widget/company detail/employees_widget.dart';
import '../../widget/company detail/partners_widget.dart';
import '../../widget/company detail/social_media_links_widget.dart';
import '../../widget/company detail/testimonial_widget.dart';
import '../../widget/company detail/why_do_you_invest_widget.dart';


class CompanyHome extends StatefulWidget {
  const CompanyHome({super.key});

  @override
  State<CompanyHome> createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {
  final double coverHeight = 150;
  final double profileHeight = 170;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    final double top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          Container(
            margin: EdgeInsets.only(bottom: bottom),
            color: Colors.blue,
            child: Image.asset(
              SImages.NIB1,
              width: double.infinity,
              height: coverHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: top,
            child: Container(
              padding: EdgeInsets.all(
                  5.0), // Adjust the padding to control the border size
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dark ? Colors.black : Colors.white,
              ),
              child: CircleAvatar(
                radius: profileHeight / 2,
                backgroundColor: SColors.lightContainer,
                backgroundImage: AssetImage(SImages.NIB2),
              ),
            ),
          ),
        ]),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Habesha Beer",
              style: dark
                  ? STextTheme.darkTextTheme.headlineMedium
                  : STextTheme.lightTextTheme.headlineLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Clutter is nothing more than postponed ",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.blue, // Set the desired text color
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        HorizontalScrollableCounter(),
        const SizedBox(
          height: 10,
        ),
        ExpandableAboutUsText(
            text:
                "Whipple's disease is a rare bacterial infection that primarily affects the small intestine. It can also involve other parts of the body, such as the joints, heart, and central nervous system. Symptoms may include weight loss, joint pain, diarrhea, and abdominal cramping. The causative agent is Tropheryma whipplei. Diagnosis often involves a combination of clinical evaluation, imaging studies, and biopsy. Treatment typically involves antibiotics, such as ceftriaxone or trimethoprim-sulfamethoxazole, for an extended period. If you suspect Whipple's disease, consult a healthcare professional for proper evaluation and management."),
        HorizontalScrollableWhyInvest(),
        HorizontalScrollableEmployeeList(),
        HorizontalScrollableTestimonial(),
        SizedBox(
          height: 20,
        ),
        HorizontalScrollablepartnersList(),
        SocialShareButtons(),
      ]),
    ));
  }
}
