import 'package:flutter/material.dart';
import 'package:sahlah/constant/colors.dart';

class OfferItem extends StatelessWidget {
  final String backgroundImage;
  final String discount;
  final String offerInfo;
  final Color colorBackground;
  const OfferItem({
required this.backgroundImage,
required this.discount,
required this.offerInfo,
required this.colorBackground,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colorBackground,
        image: DecorationImage(
            image: AssetImage(backgroundImage), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              discount,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w600 ),
              textAlign: TextAlign.start,
            ),
            Text(
              offerInfo,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}