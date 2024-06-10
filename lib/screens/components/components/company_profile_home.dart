import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_company/Models/company_profile_model.dart';
import 'package:ssen_company/Models/key_figure_model.dart';
import 'package:ssen_company/Models/testimonial_model.dart';
import 'package:ssen_company/Models/why_invest.dart';
import 'package:ssen_company/screens/about_company.dart';
import 'package:ssen_company/utils/constants.dart';
import 'package:ssen_company/utils/utils.dart';
import 'package:ssen_company/widget/company%20detail%20widget/employees_widget.dart';
import 'package:ssen_company/widget/company%20detail%20widget/faq_element_widget.dart';
import 'package:ssen_company/widget/company%20detail%20widget/testimonial_widget.dart';
import 'package:ssen_company/widget/company%20detail%20widget/why_do_you_invest_widget.dart';

import '../../../Models/faq_model.dart';
import '../../../services/theme/text_theme.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_Strings.dart';
import '../../../utils/helper_function.dart';
import '../../../widget/company detail widget/counter_tiltle_widget.dart';
import '../../../widget/company detail widget/description_widget.dart';
import '../../../widget/company detail widget/social_media_links_widget.dart';

class CompanyHome extends StatefulWidget {
  const CompanyHome(
      {super.key,
      required this.whyInvests,
      required this.company,
      required this.keyFigure,
      required this.testimonials,
      required this.faqs});
  final List<WhyInvestModel> whyInvests;
  final List<KeyFigureModel> keyFigure;
  final List<TestimonialModel> testimonials;
  final List<FaqModel> faqs;
  final CompanyProfileModel company;

  @override
  State<CompanyHome> createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {
  final double coverHeight = 150;
  final double profileHeight = 170;

  // keyFigureModel key = keyFigureModel(
  //     position: 'CEO', image: [SImages.empolyee1], name: "Wubet Ayalew");
  // keyFigureModel key2 = keyFigureModel(
  //     position: 'Supervisor', image: [SImages.employee2], name: "Dawit Negus");
  // keyFigureModel key3 = keyFigureModel(
  //     position: 'Director', image: [SImages.employee3], name: "Roba Issa");

  // Testimonials test = Testimonials(
  //   image: [SImages.empolyee1],
  //   name: 'Wubet Ayalew',
  //   position: 'CEO ',
  //   testimony:
  //       'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
  // );
  // Testimonials test2 = Testimonials(
  //   image: [SImages.employee2],
  //   name: 'Edris Alba',
  //   position: 'Director ',
  //   testimony:
  //       'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
  // );
  // Testimonials test3 = Testimonials(
  //   image: [SImages.employee3],
  //   name: 'Tom Cruse',
  //   position: 'Actor ',
  //   testimony:
  //       'If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. If 92% of people are looking for testimonial examples of social proof to help them make purchase decisions, it’s clear that quality testimonials pages can increase conversions and improve your brand image. ',
  // );
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
    FaqModel faqModel = FaqModel(
        companyId: '',
        description: 'yes',
        identification: '12454',
        title: 'about phone');
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
                  (widget.company.brandImage[0] == '')
                      ? Container(
                          margin: EdgeInsets.only(bottom: bottom),
                          color: Colors.blue,
                          child: Image.asset(
                            SImages.NIB1,
                            width: double.infinity,
                            height: coverHeight,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(bottom: bottom),
                          color: Colors.blue,
                          child: Image.network(
                            widget.company.brandImage[0],
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
                      child: (widget.company.logoImage[0] == '')
                          ? CircleAvatar(
                              radius: profileHeight / 2,
                              backgroundColor: SColors.lightContainer,
                              backgroundImage: AssetImage(SImages.NIB2),
                            )
                          : CircleAvatar(
                              radius: profileHeight / 2,
                              backgroundColor: SColors.lightContainer,
                              backgroundImage:
                                  NetworkImage(widget.company.logoImage[0]),
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
                (MediaQuery.of(context).size.width > phoneSize)
                    ? Text(
                        widget.company.name,
                        style: dark
                            ? STextTheme.darkTextTheme.headlineMedium
                            : STextTheme.lightTextTheme.headlineLarge,
                      )
                    : Text(
                        widget.company.name,
                        style: dark
                            ? STextTheme.darkTextTheme.headlineMedium!
                                .copyWith(fontSize: 20)
                            : STextTheme.lightTextTheme.headlineLarge!
                                .copyWith(fontSize: 20),
                      ),
                (MediaQuery.of(context).size.width > phoneSize)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          widget.company.motto,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color:
                                    Colors.blue, // Set the desired text color
                              ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          widget.company.motto,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: Colors.blue,
                                  fontSize: 15 // Set the desired text color
                                  ),
                        ),
                      )
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
                    values: widget.company.capital.toString(),
                    name: 'Capital',
                    icon: Icons.money),
              ],
            ),
            // HorizontalScrollableCounter(),
            const SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AboutCompany(text: widget.company.description)),
                  );
                },
                child: ExpandableAboutUsText(text: widget.company.description)),
            const SizedBox(
              height: 20,
            ),
            if (widget.whyInvests != [] || widget.whyInvests != [''])
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
            if (widget.whyInvests != [] || widget.whyInvests != [''])
              const SizedBox(
                height: 10,
              ),
            if (widget.whyInvests != [] || widget.whyInvests != [''])
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // children: [
                  //   WhyYouInvestWidget(whyinvest: widget.whyInvests[0]),
                  //   WhyYouInvestWidget(whyinvest: why2),
                  //   WhyYouInvestWidget(whyinvest: why3),
                  // ],
                  children: widget.whyInvests
                      .map((WhyInvest) =>
                          WhyYouInvestWidget(whyinvest: WhyInvest))
                      .toList(),
                ),
              ),
            SizedBox(
              height: 20,
            ),
            if (widget.keyFigure != [] || widget.keyFigure != [''])
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
            if (widget.keyFigure != [] || widget.keyFigure != [''])
              SizedBox(
                height: 10,
              ),
            if (widget.keyFigure != [] || widget.keyFigure != [''])
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // children: [
                  //   WhyYouInvestWidget(whyinvest: widget.whyInvests[0]),
                  //   WhyYouInvestWidget(whyinvest: why2),
                  //   WhyYouInvestWidget(whyinvest: why3),
                  // ],
                  children: widget.keyFigure
                      .map((onekeyFigure) =>
                          EmployeesWidget(keyfigure: onekeyFigure))
                      .toList(),
                ),
              ),
            if (widget.testimonials != [] || widget.testimonials != [''])
              SizedBox(
                height: 20,
              ),
            if (widget.testimonials != [] || widget.testimonials != [''])
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
            if (widget.testimonials != [] || widget.testimonials != [''])
              SizedBox(
                height: 10,
              ),
            if (widget.testimonials != [] || widget.testimonials != [''])
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // children: [
                  //   WhyYouInvestWidget(whyinvest: widget.whyInvests[0]),
                  //   WhyYouInvestWidget(whyinvest: why2),
                  //   WhyYouInvestWidget(whyinvest: why3),
                  // ],
                  children: widget.testimonials
                      .map((testimonial) =>
                          TestimonialWidget(testimonial: testimonial))
                      .toList(),
                ),
              ),
            SizedBox(
              height: 20,
            ),
            if (widget.company.partners != [] ||
                widget.company.partners != [''])
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

            SizedBox(
              height: 20,
            ),
            if (widget.faqs != [] || widget.faqs != [''])
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "FAQ",
                      style: dark
                          ? STextTheme.darkTextTheme.headlineSmall
                          : STextTheme.lightTextTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            if (widget.faqs != [] || widget.faqs != [''])
              SizedBox(
                height: 10,
              ),
            if (widget.faqs != [] || widget.faqs != [''])
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // children: [
                  //   WhyYouInvestWidget(whyinvest: widget.whyInvests[0]),
                  //   WhyYouInvestWidget(whyinvest: why2),
                  //   WhyYouInvestWidget(whyinvest: why3),
                  // ],
                  children: widget.faqs
                      .map((faq) => FaqElementWidget(faq: faq))
                      .toList(),
                ),
              ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       CircleAvatar(
            //         radius: 70,
            //         backgroundImage: AssetImage(SImages.partner1),
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       CircleAvatar(
            //         radius: 70,
            //         backgroundImage: AssetImage(SImages.partner2),
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       CircleAvatar(
            //         radius: 70,
            //         backgroundImage: AssetImage(SImages.partner3),
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       CircleAvatar(
            //         radius: 70,
            //         backgroundImage: AssetImage(SImages.partner4),
            //       ),
            //     ],
            //   ),
            // ),
            // HorizontalScrollableWhyInvest(),

            // HorizontalScrollableEmployeeList(),
            // HorizontalScrollableTestimonial(),

            SizedBox(
              height: 20,
            ),
            // HorizontalScrollablepartnersList(),

            SocialMediaFooter(
              company: widget.company,
            )
          ]),
        ),
      ),
    ));
  }
}
