import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_company/widget/payment_pending_request_widget.dart';
import 'package:ssen_company/widget/subscriber_widget.dart';

class Subscribers extends StatelessWidget {
  const Subscribers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [SubscriberWidget()],
      ),
    ));
  }
}
