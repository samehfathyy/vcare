import 'package:flutter/material.dart';
import 'package:vcare/core/theming/colors.dart';
import 'package:vcare/core/theming/textstyles.dart';
import 'package:vcare/core/widgets/textformfield.dart';
import 'package:vcare/features/home/screens/home.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      appBar: AppBar(
        title: Text(
          'on',
          style: TextStyles.font16dark,
        ),
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              icon: const Icon(Icons.next_plan)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppTextFormField(
              hintText: 'email',
              validator: (x) {},
            ),
          )
        ],
      ),
    );
  }
}
