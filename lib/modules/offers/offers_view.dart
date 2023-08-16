import 'package:flutter/material.dart';
import 'package:sahlah/models/offers_model.dart';
import 'package:sahlah/shared/local_storage/navigator_helper.dart';
import 'package:sahlah/shared/widgets/custom_widgets/appbar_screens.dart';
import 'package:sahlah/shared/widgets/items/offer_item.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBarScreens(
          title: 'Special Offers',
          onPressed: (){
            maybePop(context);
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20.0 , right: 20,top: 16,),
                child: OfferItem(
                colorBackground: offersList[index].colorBackground,
                backgroundImage: offersList[index].backgroundImage,
                discount: offersList[index].discount,
                offerInfo: offersList[index].offerInfo,
            ),
              );
            },
            childCount: offersList.length,
          ),
        ),
        ],
      ),
    );
  }
}


