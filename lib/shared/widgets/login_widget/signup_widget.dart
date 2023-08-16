import 'package:flutter/material.dart';
import 'package:sahlah/constant/colors.dart';
import 'package:sahlah/constant/image_assets/image_assets.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/shared/widgets/custom_widgets.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: defaultTextFormField(
              hintText: 'Username',
              prefixIcon: Icons.person,
            ),
          ),
          20.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: defaultTextFormField(
              hintText: 'email Address',
              prefixIcon: Icons.email,
            ),
          ),
          20.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: defaultTextFormField(
              hintText: 'Password',
              prefixIcon: Icons.lock,
            ),
          ),
          20.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    child: Image.asset(ImageAssets.facebook),
                  ),
                  Text('Sign Up with Facebook' , style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
          ),
          20.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    child: Image.asset(ImageAssets.google),
                  ),
                  Text('Sign Up with Google'),
                ],
              ),
            ),
          ),
          10.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Do you have an account?' , style: TextStyle(fontSize: 12),),
              20.width,
              TextButton(onPressed: (){}, child: Text('Log in Now', style: TextStyle(fontSize: 12 , color: green),),),
            ],
          ),

        ],
      ),
    );
  }
}