import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_company/Models/faq_model.dart';
import 'package:ssen_company/utils/constants/colors.dart';

class FaqElementWidget extends StatefulWidget {
  const FaqElementWidget({
    Key? key,
    required this.faq,

    // required this.function,
  }) : super(key: key);

  final FaqModel faq;

  @override
  State<FaqElementWidget> createState() => _FaqElementWidgetState();
}

class _FaqElementWidgetState extends State<FaqElementWidget> {
  bool visablity = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.3,
      color: SColors.lighGrey,
      child: Container(
        // height: 65,
        width: MediaQuery.of(context).size.width - 100,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Iconsax.message_question,
                  color: Colors.blue,
                  size: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 190,
                  child: Text(
                    widget.faq.title,
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      visablity = !visablity;
                    });
                  },
                  child: visablity
                      ? const Icon(
                          Iconsax.arrow_up,
                          color: Colors.blue,
                          size: 20,
                        )
                      : const Icon(
                          Iconsax.arrow_bottom,
                          color: Colors.blue,
                          size: 20,
                        ),
                ),
              ],
            ),
            Visibility(
                visible: visablity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                        style: TextStyle(fontSize: 12), widget.faq.description),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
