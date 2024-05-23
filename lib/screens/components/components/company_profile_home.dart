import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_company/Models/key_figure_model.dart';
import 'package:ssen_company/Models/testimonial_model.dart';
import 'package:ssen_company/Models/why_invest.dart';
import 'package:ssen_company/utils/constants.dart';
import 'package:ssen_company/widget/company%20detail%20widget/employees_widget.dart';
import 'package:ssen_company/widget/company%20detail%20widget/testimonial_widget.dart';
import 'package:ssen_company/widget/company%20detail%20widget/why_do_you_invest_widget.dart';

import '../../../services/theme/text_theme.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_Strings.dart';
import '../../../utils/helper_function.dart';
import '../../../widget/company detail widget/counter_tiltle_widget.dart';
import '../../../widget/company detail/counter_tiltle_widget.dart';
import '../../../widget/company detail widget/description_widget.dart';
import '../../../widget/company detail/employees_widget.dart';
import '../../../widget/company detail/partners_widget.dart';
import '../../../widget/company detail widget/social_media_links_widget.dart';
import '../../../widget/company detail/testimonial_widget.dart';
import '../../../widget/company detail/why_do_you_invest_widget.dart';

class CompanyHome extends StatefulWidget {
  const CompanyHome({super.key});

  @override
  State<CompanyHome> createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {
  final double coverHeight = 150;
  final double profileHeight = 170;
  WhyInvestModel why1 = WhyInvestModel(
    title: 'Benefits',
    description:
        'Ethiopian music is as diverse as its population, each ethnic group has its own sound and typical style. On top of widely popular',
  );
  WhyInvestModel why2 = WhyInvestModel(
    title: 'Divident',
    description:
        'Ethiopian music is as diverse as its population, each ethnic group has its own sound and typical style. On top of widely popular',
  );
  WhyInvestModel why3 = WhyInvestModel(
    title: 'Director',
    description:
        'Ethiopian music is as diverse as its population, each ethnic group has its own sound and typical style. On top of widely popular',
  );

  KeyFigureModel key = KeyFigureModel(
      position: 'CEO', image: [SImages.empolyee1], name: "Wubet Ayalew");
  KeyFigureModel key2 = KeyFigureModel(
      position: 'Supervisor', image: [SImages.employee2], name: "Dawit Negus");
  KeyFigureModel key3 = KeyFigureModel(
      position: 'Director', image: [SImages.employee3], name: "Roba Issa");

  TestimonialModel test = TestimonialModel(
    image: [SImages.empolyee1],
    name: 'Wubet Ayalew',
    position: 'CEO ',
    testimony:
        'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
  );
  TestimonialModel test2 = TestimonialModel(
    image: [SImages.employee2],
    name: 'Edris Alba',
    position: 'Director ',
    testimony:
        'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
  );
  TestimonialModel test3 = TestimonialModel(
    image: [SImages.employee3],
    name: 'Tom Cruse',
    position: 'Actor ',
    testimony:
        'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
  );
//     ScrollableItem(
//       image: SImages.empolyee1,
//       title: 'Wubet Ayalew',
//       authority: 'CEO',
//       description:
//           'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
//     ),

//     ScrollableItem(
//       image: SImages.employee2,
//       title: 'Birhan Mulugeta',
//       authority: 'CEO',
//       description:
//           'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
//     ),

//     ScrollableItem(
//       image: SImages.employee3,
//       title: 'Director ',
//       authority: 'CEO',
//       description:
//           'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
//     ),
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    final double top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          width: (MediaQuery.of(context).size.width > phoneSize)
              ? MediaQuery.of(context).size.width - 300
              : MediaQuery.of(context).size.width,
          child: Column(children: [
            Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CounterItem(
                    values: '1000+', name: 'Shares', icon: Icons.shopping_cart),
                CounterItem(
                    values: '100+', name: 'Subscriber', icon: Icons.people),
                CounterItem(
                    values: '1000+', name: 'Capital', icon: Icons.money),
              ],
            ),
            // HorizontalScrollableCounter(),
            const SizedBox(
              height: 10,
            ),
            ExpandableAboutUsText(
                text:
                    "Whipple's disease is a rare bacterial infection that primarily affects the small intestine. It can also involve other parts of the body, such as the joints, heart, and central nervous system. Symptoms may include weight loss, joint pain, diarrhea, and abdominal cramping. The causative agent is Tropheryma whipplei. Diagnosis often involves a combination of clinical evaluation, imaging studies, and biopsy. Treatment typically involves antibiotics, such as ceftriaxone or trimethoprim-sulfamethoxazole, for an extended period. If you suspect Whipple's disease, consult a healthcare professional for proper evaluation and management."),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Why Do You Want To Invest?",
                    style: dark
                        ? STextTheme.darkTextTheme.headlineSmall
                        : STextTheme.lightTextTheme.headlineSmall,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WhyYouInvestWidget(whyinvest: why1),
                  WhyYouInvestWidget(whyinvest: why2),
                  WhyYouInvestWidget(whyinvest: why3),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Key Figures",
                    style: dark
                        ? STextTheme.darkTextTheme.headlineSmall
                        : STextTheme.lightTextTheme.headlineSmall,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EmployeesWidget(keyfigure: key),
                  EmployeesWidget(keyfigure: key2),
                  EmployeesWidget(keyfigure: key3),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Testimonial",
                    style: dark
                        ? STextTheme.darkTextTheme.headlineSmall
                        : STextTheme.lightTextTheme.headlineSmall,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TestimonialWidget(testimonial: test),
                  TestimonialWidget(testimonial: test2),
                  TestimonialWidget(testimonial: test3),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Partners",
                    style: dark
                        ? STextTheme.darkTextTheme.headlineSmall
                        : STextTheme.lightTextTheme.headlineSmall,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(SImages.partner1),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(SImages.partner2),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(SImages.partner3),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(SImages.partner4),
                  ),
                ],
              ),
            ),
            // HorizontalScrollableWhyInvest(),

            // HorizontalScrollableEmployeeList(),
            // HorizontalScrollableTestimonial(),
            SizedBox(
              height: 20,
            ),
            // HorizontalScrollablepartnersList(),
            SocialShareButtons()
          ]),
        ),
      ),
    ));
  }
}
