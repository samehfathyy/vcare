import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:vcare/core/dependency_injection.dart';
import 'package:vcare/features/signup/cubit/cubit/signup_cubit.dart';
import 'package:vcare/features/signup/widgets/account_form.dart';
import 'package:vcare/features/signup/widgets/personal_details_form.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupCubit>(),
      child: Scaffold(
        body: BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            return PageView(
              controller: context.read<SignupCubit>().pageController,
              children: [
                PersonalDetailsForm(),
                AccountForm(),
              ],
            );
          },
        ),
      ),
    );
  }
}
