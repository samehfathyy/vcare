import 'package:flutter/material.dart';
import 'package:vcare/features/home/screens/home.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('on'),
      ),
      body: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home()));
          },
          icon: Icon(Icons.next_plan)),
    );
  }
}
