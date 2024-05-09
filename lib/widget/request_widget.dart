import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';



import '../../services/theme/text_theme.dart';

import '../screens/request_detail.dart';
import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';

class RequestWidget extends StatelessWidget {
  const RequestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () {
       Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
               Requestdetail(
        requestStatus: 'Pending',
        requestDate: 'April 25, 2024',
        requestDescription:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed efficitur, ante nec aliquam consequat, ligula est pellentesque libero, id laoreet elit justo id purus.',
        requesterName: 'John Doe',
        requesterEmail: 'john.doe@example.com',
        requesterPhoneNumber: '+1234567890',
        requesterAddress: '123 Main St, City, Country',
      ),), // Replace ShareholderDetailPage() with your actual detail page
        );
      },
      child: Container(
        height: 110,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: dark ? SColors.darkContainer : SColors.lightContainer,
          // borderRadius: BorderRadius.circular(14),
          border: Border.all(
              width: 1,
              color: dark
                  ? Colors.black
                  : Colors.white), // Adjust border properties as needed
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('asset/logo_image/goat.jpg'),
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dawit Nigus",
                      style: dark
                          ? STextTheme.darkTextTheme.headlineSmall
                          : STextTheme.lightTextTheme.headlineSmall),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        // color: Colors.black,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Addis Ababa, Ethiopia",
                        // style: STextTheme.lightTextTheme.bodySmall
                        //     ?.copyWith(color: Colors.blue),
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.mobile_friendly,
                            color: Colors.blue,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "pending",
                            style: dark
                                ? STextTheme.darkTextTheme.bodySmall
                                : STextTheme.lightTextTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.monetization_on_outlined,
                            color: Colors.blue,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "1M Invested",
                            style: dark
                                ? STextTheme.darkTextTheme.bodySmall
                                : STextTheme.lightTextTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
