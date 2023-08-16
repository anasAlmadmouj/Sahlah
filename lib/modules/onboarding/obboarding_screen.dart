import 'package:flutter/material.dart';
import 'package:sahlah/constant/colors.dart';
import 'package:sahlah/models/onboarding_model.dart';
import 'package:sahlah/modules/login/login.dart';
import 'package:sahlah/shared/local_storage/local_storage/cache_helper.dart';
import 'package:sahlah/shared/local_storage/navigator_helper.dart';
import 'package:sahlah/shared/widgets/custom_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  bool isLast = false;

  void submit() => CacheHelper.saveData(
        key: 'onBoarding',
        value: true,
      ).then((value) {
        if (value) {
          navigateToReplacement(context, LogInScreen());
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          !isLast ? TextButton(
            onPressed: submit,
            child: Text(
               'Skip',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          )
          : SizedBox(),
        ],
      ),
      body: PageView.builder(
        controller: boardController,
        physics: BouncingScrollPhysics(),
        onPageChanged: (index) {
          if (index == onBoardingList.length - 1) {
            setState(() {
              isLast = true;
              submit();
            });
          } else {
            setState(() {
              isLast = false;
            });
          }
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                onBoardingList[index].image,
                width: 340,
                height: 270,
              ),
              Text(
                onBoardingList[index].title,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
              ),
              Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[index].deteals,
                    style: TextStyle(
                      fontSize: 18,
                      height: 2,
                    ),
                    textAlign: TextAlign.center,
                  )),
              SmoothPageIndicator(
                controller: boardController,
                count: onBoardingList.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Color(0xff5BE07A),
                  dotColor: grey,
                  spacing: 5,
                  expansionFactor: 4,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: defaultElevatedButton(
                  function: () {
                    if (isLast) {
                      submit;
                    } else {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  text: index == 2 ? 'Get Started' : 'Continue',
                  borderRadius: 16,
                  backGroundColor: green,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
