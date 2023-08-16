import 'package:flutter/material.dart';
import 'package:sahlah/main.dart';

class MenuItem extends StatelessWidget {
  final String image;
  final String name;
  final String restaurant;
  final double price;
  final IconData favIcon;
  final Color favColor;
  final VoidCallback? onPressedFav;
  final VoidCallback? onPressedCart;
  const MenuItem({
    required this.image,
    required this.name,
    required this.price,
    required this.restaurant,
    required this.favColor,
    required this.favIcon,
    required this.onPressedFav,
    required this.onPressedCart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Color(0xffFFFDF3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(fit: StackFit.expand, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: onPressedFav,
                icon: Icon(
                  favIcon,
                  color: favColor,
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              height: 80,
              fit: BoxFit.cover,
            ),
            10.height,
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              restaurant,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: '$price',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                      ),
                      children: const [
                        TextSpan(
                          text: ' JOD',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                      child: IconButton(onPressed: onPressedCart, icon: Icon(Icons.add , size: 14,color: Colors.white,)))
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
