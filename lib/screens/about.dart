import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';

class AboutUs extends StatefulWidget {
  static const route = "About";
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About Us',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: dark ? SColors.darkContainer : SColors.lightContainer,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          constraints:
              BoxConstraints(maxWidth: width > 800 ? 800 : width * 0.9),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Our Mission',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '[Your Company Name] is dedicated to providing the best service and products to our customers. Our mission is to innovate and lead in our industry, offering unparalleled value and quality.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 16),
                Text(
                  'Our Vision',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'We envision a future where our solutions make a significant impact on the lives of our customers and the community. We strive to be a leader in sustainability and innovation, setting new standards for excellence in our field.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 16),
                Text(
                  'Our Values',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '1. Customer Satisfaction: We put our customers at the heart of everything we do.\n'
                  '2. Innovation: We are committed to continuous improvement and innovation.\n'
                  '3. Integrity: We operate with integrity and transparency in all our dealings.\n'
                  '4. Quality: We strive for excellence in the quality of our products and services.\n'
                  '5. Teamwork: We believe in the power of collaboration and teamwork.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 16),
                Text(
                  'Our History',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '[Your Company Name] was founded in [Year] with a vision to revolutionize the industry. Over the years, we have grown from a small startup to a leading company in the market, thanks to our unwavering commitment to quality and customer satisfaction.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 16),
                Text(
                  'Our Team',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Our team is comprised of talented and dedicated professionals who are passionate about what they do. We work together to achieve our common goals and ensure that our customers receive the best possible service.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
