import 'package:flutter/material.dart';
import 'package:sahlah/constant/colors.dart';

Widget defaultElevatedButton({
  Color? backGroundColor,
  double? height = 50.0,
  double? width = double.infinity,
  VoidCallback? function,
  String? text,
  double? borderRadius = 0.0,
  double? fontSize = 18.0,
  Color? colorText = Colors.white,
  Color borderSideColor = Colors.white,
}) => SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(backGroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder >(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              side: BorderSide(color: borderSideColor),
            ),
          ),
        ),
        onPressed: function,
        child: Text(
          "$text",
          style: TextStyle(
            color: colorText,
            fontSize: fontSize,
          ),
        ),
      ),
    );

Widget defaultTextFormField({
  var controller,
  var onSubmit,
  bool obscureText = false,
  TextInputType? keyboardType,
  TextInputAction? action,
  String? labelText,
  String? hintText = "",
  IconData? prefixIcon,
  IconData? suffixIcon,
  VoidCallback? suffixPressed,
  bool? enabled,
  FormFieldValidator<String>? validation,
  context,
}) =>
    TextFormField(
      enabled: enabled,
      onFieldSubmitted: onSubmit,
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      textInputAction: action,
      decoration: InputDecoration(
        enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(16) , borderSide: BorderSide(color: Colors.grey.shade300)),
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: Padding(
          padding: EdgeInsetsDirectional.only(end: 10.0),
          child: IconButton(
            onPressed: suffixPressed,
            icon: Icon(suffixIcon),
          ),
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15.0),
        // ),
      ),
      validator: validation,
    );