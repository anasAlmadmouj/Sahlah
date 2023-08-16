import 'dart:ui';

import 'package:sahlah/constant/colors.dart';
import 'package:sahlah/constant/image_assets/image_assets.dart';

class OffersModel {
  final int id;
  final String backgroundImage;
  final String discount;
  final String offerInfo;
  final Color colorBackground;

  OffersModel({
    required this.backgroundImage,
    required this.discount,
    required this.offerInfo,
    required this.id,
    required this.colorBackground,
  });
}

List<OffersModel> offersList = [
  OffersModel(
    id: 1,
    colorBackground: green,
    backgroundImage: ImageAssets.burgerOffer,
    discount: '30%',
    offerInfo: 'Special Deal \n For October!',
  ),
  OffersModel(
    id: 2,
    colorBackground: const Color(0xFFFBC051),
    backgroundImage: ImageAssets.redPizzaOffer,
    discount: '25%',
    offerInfo: 'Special Deal \n For October!',
  ),
  OffersModel(
    id: 3,
    colorBackground: const Color(0xFF2797D5),
    backgroundImage: ImageAssets.bluePizzaOffer,
    discount: '25%',
    offerInfo: 'Special Deal \n For October!',
  ),
  OffersModel(
    id: 4,
    colorBackground: const Color(0xFFF2502C),
    backgroundImage: ImageAssets.filletFishOffer,
    discount: '40%',
    offerInfo: 'Special Deal \n For October!',
  ),
];
