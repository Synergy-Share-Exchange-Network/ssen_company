import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_company/Models/company_profile_model.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/helper_function.dart';

class ContactUsWidget extends StatelessWidget {
  final CompanyProfileModel contactus;
  const ContactUsWidget({
    Key? key,
    required this.contactus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      width: 150.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact Us",
            style: dark
                ? STextTheme.darkTextTheme.headlineSmall
                : STextTheme.lightTextTheme.headlineSmall,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Iconsax.call,
                color: Colors.black,
                size: 18,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                contactus.phoneNumber,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(
                Iconsax.card,
                color: Colors.black,
                size: 18,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                contactus.email,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(
                Iconsax.home,
                color: Colors.black,
                size: 18,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                contactus.locationDescription,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(
                Iconsax.card,
                color: Colors.black,
                size: 18,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                contactus.poBox,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
