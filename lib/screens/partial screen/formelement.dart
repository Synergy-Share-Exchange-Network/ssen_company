import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class FormElement extends StatelessWidget {
  const FormElement({
    Key? key,
    required this.title,
    important,
  }) : important = important ?? false;
  final String title;
  final bool important;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width > phoneSize) ? 155 : 200,
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          if (important)
            const Text(
              "*",
              style: TextStyle(color: Colors.red),
            )
        ],
      ),
    );
  }
}

class FormElementLarge extends StatelessWidget {
  const FormElementLarge({
    Key? key,
    required this.title,
    important,
  }) : important = important ?? false;
  final String title;
  final bool important;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width > phoneSize) ? 170 : 210,
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          if (important)
            const Text(
              "*",
              style: TextStyle(color: Colors.red),
            )
        ],
      ),
    );
  }
}
