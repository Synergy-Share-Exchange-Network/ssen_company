import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:ssen_company/screens/partial%20screen/add_share.dart';
import 'package:ssen_company/screens/partial%20screen/edit_main_profile.dart';
import 'package:ssen_company/utils/constants.dart';

import '../Models/company_profile_model.dart';
import '../Models/share_model.dart';
import '../provider/company_provider.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/navbar.dart';
import '../utils/helper_function.dart';
import '../widget/analytics/graph1.dart';
import '../widget/share_detail_element_widget.dart';

class SharePage extends StatefulWidget {
  const SharePage({Key? key}) : super(key: key);

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    // ShareModel share = ShareModel(
    //   savingAccountPercentage: 20.0,
    //   proclamationNumber: "proclamation number: 45363829836345",
    //   minimumNumberOfBuyer: 23,
    //   maximumNumberOfBuyer: 15,
    //   bankInformation: ['bankInfo1', 'bankInfo2'],
    //   shareImage: ["asset/logo_image/goat.jpg"],
    //   unitSharePrice: 67.0,
    //   noOfShares: 50.0,
    //   divident: 60.0,
    //   minimumPaymentInPercent: 10.0,
    //   minimumNumberOfSharesToBuy: 9.0,
    //   maximumNumberOfSharesToBuy: 15.0,
    //   requirement: "requirement",
    //   description:
    //       "Habesha Breweries S.C Founded by 8,000 proud Ethiopian shareholders who were moved by the vision of reaching and connecting with Ethiopians, Habesha Breweries.",
    //   searchKeyWords: ['bankInfo1', 'bankInfo2'],
    //   // returnDividentTimeInDays: 56,
    //   timeToReturnRemainPayment: 20,
    //   // currancy: "currancy",
    // );
    ShareModel share = ShareModel(
      savingAccountPercentage: 12.5,
      proclamationNumber: "PRO123",
      minimumNumberOfBuyer: 5,
      maximumNumberOfBuyer: 20,
      bankInformation: ['Bank A', 'Bank B', 'Bank C'],
      shareImage: ['image1.jpg', 'image2.jpg'],
      unitSharePrice: 15.75,
      noOfShares: 500,
      divident: 7.2,
      minimumPaymentInPercent: 10.0,
      minimumNumberOfSharesToBuy: 1.0,
      maximumNumberOfSharesToBuy: 50.0,
      requirement: "Valid ID proof required",
      identification: "ABC123",
      companyID: "COMP456",
      description: "Invest in our company shares for great returns!",
      searchKeyWords: ['investment', 'shares', 'dividend'],
      returnDividentDescription: ["Yearly", "Biannually"],
      timeToReturnRemainPayment: 90,
      currency: "USD",
      dateAdded: "2024-05-18",
      isDeleted: false,
      isHidden: false,
    );
    CompanyProfileModel company = Provider.of<UserProvider>(context).getCompany;

    return Scaffold(
      drawer: (MediaQuery.of(context).size.width > phoneSize) ? null : NavBar(),
      appBar: (MediaQuery.of(context).size.width > phoneSize)
          ? null
          : AppBar(
              actions: const [
                Icon(Iconsax.notification),
                SizedBox(
                  width: 10,
                ),
                Icon(Iconsax.search_normal),
                SizedBox(
                  width: 20,
                )
              ],
              backgroundColor:
                  !dark ? SColors.lighGrey : SColors.homePageNavBar,

              // elevation: 1,
            ),
      body: (company.shareID == "")
          ? Center(
              child: ElevatedButton(
                  onPressed: () async {
                    (MediaQuery.of(context).size.width > phoneSize)
                        ? showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  actions: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      width: (MediaQuery.of(context)
                                                  .size
                                                  .width >
                                              phoneSize)
                                          ? MediaQuery.of(context).size.width -
                                              70
                                          : MediaQuery.of(context).size.width,
                                      height: (MediaQuery.of(context)
                                                  .size
                                                  .width >
                                              phoneSize)
                                          ? MediaQuery.of(context).size.height -
                                              80
                                          : MediaQuery.of(context).size.height -
                                              100,
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Add Share",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 18),
                                              ),
                                              IconButton(
                                                  onPressed: () => Navigator.of(
                                                          context,
                                                          rootNavigator: true)
                                                      .pop(),
                                                  icon: const Icon(
                                                    Icons.close,
                                                    color: Colors.red,
                                                  ))
                                            ],
                                          ),
                                          const Expanded(
                                            child: AddPost(),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddPost()));
                  },
                  child: Text("Add Share")),
            )
          : (MediaQuery.of(context).size.width > phoneSize)
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container(
                              //   child: const CircleAvatar(
                              //     radius: 45,
                              //     backgroundImage:
                              //         AssetImage('asset/logo_image/goat.jpg'),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 14,
                              // ),
                              Container(
                                child: const Text(
                                  "Habesha Breweries S.C",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Icon(
                                    Iconsax.location,
                                    color: Colors.grey,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const Text(
                                    "addis ababa",
                                    // style: STextTheme.lightTextTheme.bodySmall
                                    //     ?.copyWith(color: Colors.blue),
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Icon(
                                    Iconsax.location,
                                    color: Colors.grey,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const Text(
                                    "brewery",
                                    // style: STextTheme.lightTextTheme.bodySmall
                                    //     ?.copyWith(color: Colors.blue),
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  share.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage(share.shareImage[0]))),
                              ),
                            ],
                          )),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              const SizedBox(
                                height: 70,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  ShareDetailElementWidget(
                                    title1: 'unit Share Price ',
                                    content: 'ETB(birr)',
                                    contentPrice: '${share.unitSharePrice}',
                                    title2: 'Number ',
                                    content2: '${share.maximumNumberOfBuyer}',
                                    contentPrice2:
                                        '${share.minimumNumberOfBuyer}',
                                  ),
                                  ShareDetailElementWidget(
                                    title1: 'number share ',
                                    content: '${share.noOfShares}',
                                    contentPrice: '200 units',
                                    title2: 'Divident  ',
                                    content2: '${share.divident}',
                                    contentPrice2:
                                        // '${share.returnDividentTimeInDays}',
                                        '',
                                  ),
                                  ShareDetailElementWidget(
                                    title1: 'min payment ',
                                    content: '${share.minimumPaymentInPercent}',
                                    contentPrice: '!/2',
                                    title2: 'no of share to buy ',
                                    content2:
                                        '${share.maximumNumberOfSharesToBuy}',
                                    contentPrice2:
                                        '${share.minimumNumberOfSharesToBuy}',
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.tick_circle,
                            // color: Colors.black,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 550,
                            child: Text(
                              share.proclamationNumber,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.tick_circle,
                            // color: Colors.black,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 550,
                            child: const Text(
                              "saving account",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Iconsax.arrow_down_14,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.tick_circle,
                            // color: Colors.black,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 550,
                            child: const Text(
                              "requirment",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Iconsax.arrow_down_14,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.tick_circle,
                            // color: Colors.black,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 550,
                            child: const Text(
                              "time to return remain payment",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Iconsax.arrow_down_14,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 45,
                          backgroundImage:
                              AssetImage('asset/logo_image/goat.jpg'),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const Text(
                          "Habesha Breweries S.C",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Iconsax.location,
                              color: Colors.grey,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text(
                              "addis ababa",
                              // style: STextTheme.lightTextTheme.bodySmall
                              //     ?.copyWith(color: Colors.blue),
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Icon(
                              Iconsax.location,
                              color: Colors.grey,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text(
                              "brewery",
                              // style: STextTheme.lightTextTheme.bodySmall
                              //     ?.copyWith(color: Colors.blue),
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            share.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(share.shareImage[0]))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            ShareDetailElementWidget(
                              title1: 'unit Share Price ',
                              content: 'ETB(birr)',
                              contentPrice: '${share.unitSharePrice}',
                              title2: 'Number ',
                              content2: '${share.maximumNumberOfBuyer}',
                              contentPrice2: '${share.minimumNumberOfBuyer}',
                            ),
                            ShareDetailElementWidget(
                              title1: 'number share ',
                              content: '${share.noOfShares}',
                              contentPrice: '200 units',
                              title2: 'Divident  ',
                              content2: '${share.divident}',
                              // contentPrice2: '${share.returnDividentTimeInDays}',
                              contentPrice2: '',
                            ),
                            ShareDetailElementWidget(
                              title1: 'min payment ',
                              content: '${share.minimumPaymentInPercent}',
                              contentPrice: '!/2',
                              title2: 'no of share to buy ',
                              content2: '${share.maximumNumberOfSharesToBuy}',
                              contentPrice2:
                                  '${share.minimumNumberOfSharesToBuy}',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 70,
                              child: Text(
                                share.proclamationNumber,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 70,
                              child: const Text(
                                "saving account",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Iconsax.arrow_down_14,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 70,
                              child: const Text(
                                "requirment",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Iconsax.arrow_down_14,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 70,
                              child: const Text(
                                "time to return remain payment",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Iconsax.arrow_down_14,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
