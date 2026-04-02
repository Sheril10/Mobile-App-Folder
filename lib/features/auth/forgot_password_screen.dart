import 'package:flutter/material.dart';
import '../../core/widgets/common_input_field.dart';
import '../../core/widgets/primary_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('The', style: TextStyle(fontSize: 20)),
                    Text('Elegance.', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, height: 0.9)),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 30, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 35),
                    CommonInputField(label: 'Enter Username/Email:'),
                    CommonInputField(label: 'New Password :', isPassword: true),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              PrimaryButton(
                text: 'Login',
                color: Colors.black,
                onPressed: () {
                  // This takes the user back to the Login Screen
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}