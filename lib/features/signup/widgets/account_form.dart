import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:vcare/features/signup/cubit/cubit/signup_cubit.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({super.key});

  @override
  State<AccountForm> createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  context.read<SignupCubit>().previouspage();
                },
                child: Text('back')),
          )
        ],
      ),
    );
  }
}
