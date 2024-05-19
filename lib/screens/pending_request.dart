import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_company/screens/signup.dart';

class PendingRequest extends StatelessWidget {
  const PendingRequest({Key? key}) : super(key: key);
  static const route = "pendingRequest";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Your accound is being processed"),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, SignUp.route);
                },
                child: Text("  Log Out  "))
          ],
        ),
      ),
    );
  }
}
