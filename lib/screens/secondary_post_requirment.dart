import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages

import '../utils/constants.dart';
import '../utils/constants/size.dart';
import '../utils/constants/text_string.dart';

class SecondaryPostRequirment extends StatelessWidget {
  const SecondaryPostRequirment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Share'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: (MediaQuery.of(context).size.width < phoneSize)
                  ? MediaQuery.of(context).size.width
                  : 500,
            ),
            child: Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            // const FormElement(
                            //   title: "No of Share",
                            //   important: true,
                            // ),
                            const SizedBox(
                              height: SSizes.spaceBtwItems / 2,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "max no of share to sell"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: SSizes.spaceBtwItems,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            // const FormElement(
                            //   title: "Per Share Price",
                            //   important: true,
                            // ),
                            const SizedBox(
                              height: SSizes.spaceBtwItems / 2,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "min no of share to sell"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwInputField,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const FormElement(
                      //   title: "Contact",
                      // ),
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'minimum price per share'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwInputField,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const FormElement(
                      //   title: "Company Name",
                      // ),
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "maximum price per share"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwInputField,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const FormElement(
                      //   title: "Company Name",
                      // ),
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'is open to sell'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwInputField,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const FormElement(
                      //   title: "Company Name",
                      // ),
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Restricted users to sell'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwInputField,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Implement your post functionality here
                        },
                        child: Text('Post'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Implement your discard functionality here
                        },
                        child: Text('Discard'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
