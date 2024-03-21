import 'package:flutter/material.dart';

class SocialMediaLink extends StatelessWidget {
  const SocialMediaLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.white,
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.ac_unit,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.white,
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.ac_unit,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.white,
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.ac_unit,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.white,
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.ac_unit,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
