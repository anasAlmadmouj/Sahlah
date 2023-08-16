import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/app_cubit/app_state.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/models/near_to_you_model.dart';
import 'package:sahlah/models/offers_model.dart';
import 'package:sahlah/models/top_rated_model.dart';
import 'package:sahlah/modules/offers/offers_view.dart';
import 'package:sahlah/shared/local_storage/navigator_helper.dart';
import 'package:sahlah/shared/widgets/items/offer_item.dart';
import 'package:sahlah/shared/widgets/items/suggestions_item.dart';
import 'package:sahlah/shared/widgets/items/title_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
      builder: (context, state){
        return Column(
          children: [
            TitleItem(
              onPressed: (){
                navigateTo(context, const OffersView());
              },
              title: 'Special Offers',
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => OfferItem(
                  colorBackground: offersList[index].colorBackground,
                  backgroundImage: offersList[index].backgroundImage,
                  discount: offersList[index].discount,
                  offerInfo: offersList[index].offerInfo,
                ),
                itemCount: 2,
              ),
            ),
            TitleItem(
              onPressed: (){},
              title: 'top Rated',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SuggestionsItem(
                    image: topRatedList[index].image,
                    price: topRatedList[index].price,
                    name: topRatedList[index].name,
                  ),
                  separatorBuilder: (context, index) => 20.width,
                  itemCount: topRatedList.length,
                ),
              ),
            ),
            TitleItem(
              onPressed: (){},
              title: 'Near to you',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SuggestionsItem(
                    image: nearToYouList[index].image,
                    price: nearToYouList[index].price,
                    name: nearToYouList[index].name,
                  ),
                  separatorBuilder: (context, index) => 20.width,
                  itemCount: nearToYouList.length,
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}