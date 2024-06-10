import 'package:flutter/material.dart';
import 'package:ssen_company/Models/faq_model.dart';
import 'package:ssen_company/utils/constants/colors.dart';
import '../../utils/constants.dart';

class FaqElementWidget extends StatefulWidget {
  const FaqElementWidget({
    Key? key,
    required this.faq,
  }) : super(key: key);

  final FaqModel faq;

  @override
  State<FaqElementWidget> createState() => _FaqElementWidgetState();
}

class _FaqElementWidgetState extends State<FaqElementWidget> {
  bool visability = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isPhone = screenWidth <= phoneSize;

    return Card(
      elevation: 0.3,
      color: SColors.lighGrey,
      child: Container(
        width: isPhone ? screenWidth - 75 : screenWidth - 600,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.question_mark_outlined,
                  color: Colors.blue,
                  size: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    widget.faq.title,
                    style: const TextStyle(color: Colors.blue, fontSize: 14),
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
                      visability = !visability;
                    });
                  },
                  child: visability
                      ? const Icon(
                          Icons.keyboard_arrow_up_sharp,
                          color: Colors.blue,
                          size: 20,
                        )
                      : const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.blue,
                          size: 20,
                        ),
                ),
              ],
            ),
            Visibility(
              visible: visability,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.faq.description,
                        style: const TextStyle(fontSize: 12),
                      ),
                      Expanded(child: SizedBox())
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
