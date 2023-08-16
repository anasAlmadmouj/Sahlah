import 'package:flutter/material.dart';
import 'package:sahlah/constant/colors.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/shared/widgets/custom_widgets.dart';

class SuggestionsItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  const SuggestionsItem({
    required this.image,
    required this.price,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.amberAccent.withOpacity(.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
          10.height,
          Text(
            textAlign: TextAlign.center,
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          5.height,
          defaultElevatedButton(
              text: price,
              backGroundColor: green,
              width: 100,
              height: 20,
              colorText: Colors.white,
              borderRadius: 16,
              fontSize: 14
          ),
        ],
      ),
    );
  }
}
