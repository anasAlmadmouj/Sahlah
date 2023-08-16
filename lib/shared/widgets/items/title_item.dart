import 'package:flutter/material.dart';

class TitleItem extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const TitleItem({
    required this.title,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,),
      child: Row(
        children: [
           Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          TextButton(
            onPressed: onPressed,
            child: const Text(
              'See All',
              style: TextStyle(
                color: Colors.green,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}