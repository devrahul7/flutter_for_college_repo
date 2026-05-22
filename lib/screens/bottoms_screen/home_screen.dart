import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          Text("Hello From Home Screen"),
          TextField(),
          TextField(),
          ElevatedButton(
            onPressed: () {},
            child: Text("I am button from Home"),
          ),
        ],
      ),
    );
  }
}
