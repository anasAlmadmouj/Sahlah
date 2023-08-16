import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/constant/colors.dart';
import 'package:sahlah/constant/image_assets/image_assets.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/modules/login/login_cubit/login_cubit.dart';
import 'package:sahlah/modules/login/login_cubit/login_state.dart';
import 'package:sahlah/shared/widgets/custom_widgets.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
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
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                ),
              ),
              20.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: defaultTextFormField(
                  hintText: 'email',
                  prefixIcon: Icons.email,
                ),
              ),
              10.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){}, child: Text('Forgot Password?' , style: TextStyle(color: green, fontSize: 14),)),
                ],
              ),
              20.height,
              Text('or login with' , style: TextStyle(fontSize: 12),),
              25.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Image.asset(ImageAssets.google),
                  ),
                  25.width,
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Image.asset(ImageAssets.facebook),
                  ),
                  25.width,
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Image.asset(ImageAssets.twitter),
                  ),
                ],
              ),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have an account?' , style: TextStyle(fontSize: 12),),
                  20.width,
                  TextButton(onPressed: (){}, child: Text('Register now', style: TextStyle(fontSize: 12 , color: green),),),
                ],
              ),

            ],
          ),
        );
  }
}