import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants/colors.dart';
import '../../utils/helper_function.dart';
import '../../widget/edit profile/edit_description.dart';
import '../../widget/edit profile/edit_testimonial.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
       appBar: AppBar(
        title: Text(
          'Edit Post',
          style: dark
              ? STextTheme.darkTextTheme.headlineMedium
              : STextTheme.lightTextTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           EditDescription(title: 'Company Name',),
           EditDescription(title: 'Company Motto',),
           EditDescription(title: 'About Us',),
          EditTestimonial(title: 'Testimonial',),
    
          ],
        ),
      ),
    );

  }
}