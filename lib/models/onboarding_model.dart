import 'package:sahlah/constant/image_assets/image_assets.dart';

class OnBoardingModel{
  final String image;
  final String title;
  final String deteals;
  OnBoardingModel(this.image , this.title , this.deteals);
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(ImageAssets.onBoarding1, 'Welcome to Sahlah', 'Enjoy a fast and smooth food delivery \n at your doorstep'),
  OnBoardingModel(ImageAssets.onBoarding2, 'Get delivery on time', 'Order your favorite food within the \n palm of your hand and the zone of \n your comfort.'),
  OnBoardingModel(ImageAssets.onBoarding3, 'Choose your food', 'Order your favorite food within the \n palm of your hand and the zone of \n your comfort.'),
];