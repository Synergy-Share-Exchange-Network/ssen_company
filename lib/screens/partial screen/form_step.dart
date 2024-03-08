import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class FormStep extends StatelessWidget {
  const FormStep({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          width: (_screensize > phoneSize) ? 40 : 25,
          height: (_screensize > phoneSize) ? 40 : 25,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          child: Center(
            child: Text(
              "1",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: (MediaQuery.of(context).size.width > phoneSize)
                      ? 20
                      : 15),
            ),
          ),
        ),
        index > 1
            ? SizedBox(
                width: (_screensize > phoneSize) ? 100 : 20,
                child: const Divider(
                  color: Colors.blue,
                ))
            : SizedBox(
                width: (_screensize > phoneSize) ? 100 : 20,
                child: const Divider()),
        index > 1
            ? Container(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                width: (_screensize > phoneSize) ? 40 : 25,
                height: (_screensize > phoneSize) ? 40 : 25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child: Center(
                  child: Text(
                    "2",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            (MediaQuery.of(context).size.width > phoneSize)
                                ? 20
                                : 15),
                  ),
                ),
              )
            : Container(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                width: (_screensize > phoneSize) ? 40 : 25,
                height: (_screensize > phoneSize) ? 40 : 25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color.fromARGB(15, 0, 0, 0)),
                child: Center(
                  child: Text(
                    "2",
                    style: TextStyle(
                        color: Color.fromARGB(60, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize:
                            (MediaQuery.of(context).size.width > phoneSize)
                                ? 20
                                : 15),
                  ),
                ),
              ),
        index > 2
            ? SizedBox(
                width: (_screensize > phoneSize) ? 100 : 20,
                child: const Divider(
                  color: Colors.blue,
                ))
            : SizedBox(
                width: (_screensize > phoneSize) ? 100 : 20, child: Divider()),
        index > 2
            ? Container(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                width: (_screensize > phoneSize) ? 40 : 25,
                height: (_screensize > phoneSize) ? 40 : 25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child: Center(
                  child: Text(
                    "3",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            (MediaQuery.of(context).size.width > phoneSize)
                                ? 20
                                : 15),
                  ),
                ),
              )
            : Container(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                width: (_screensize > phoneSize) ? 40 : 25,
                height: (_screensize > phoneSize) ? 40 : 25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color.fromARGB(15, 0, 0, 0)),
                child: Center(
                  child: Text(
                    "3",
                    style: TextStyle(
                        color: Color.fromARGB(60, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize:
                            (MediaQuery.of(context).size.width > phoneSize)
                                ? 20
                                : 15),
                  ),
                ),
              ),
        index > 3
            ? SizedBox(
                width: (_screensize > phoneSize) ? 100 : 20,
                child: const Divider(
                  color: Colors.blue,
                ))
            : SizedBox(
                width: (_screensize > phoneSize) ? 100 : 20, child: Divider()),
        index > 3
            ? Container(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                width: (_screensize > phoneSize) ? 40 : 25,
                height: (_screensize > phoneSize) ? 40 : 25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child: Center(
                  child: Text(
                    "4",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            (MediaQuery.of(context).size.width > phoneSize)
                                ? 20
                                : 15),
                  ),
                ),
              )
            : Container(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                width: (_screensize > phoneSize) ? 40 : 25,
                height: (_screensize > phoneSize) ? 40 : 25,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color.fromARGB(15, 0, 0, 0)),
                child: Center(
                  child: Text(
                    "4",
                    style: TextStyle(
                        color: Color.fromARGB(60, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize:
                            (MediaQuery.of(context).size.width > phoneSize)
                                ? 20
                                : 15),
                  ),
                ),
              ),
      ],
    );
  }
}
