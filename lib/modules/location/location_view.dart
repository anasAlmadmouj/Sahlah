import 'package:flutter/material.dart';
import 'package:sahlah/constant/colors.dart';
import 'package:sahlah/constant/image_assets/image_assets.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/modules/notifications/notification_view.dart';
import 'package:sahlah/shared/local_storage/navigator_helper.dart';

class LocationView extends StatefulWidget {
  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: grey,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Deliver to',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                10.height,
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.green,
                    ),
                    10.width,
                    const Text(
                      'Amman',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    10.width,
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    onTap: () {
                      navigateTo(context, NotificationsView(),);
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Badge(
                        backgroundColor: Colors.green,
                        label: Text('1'),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
              // width: double.infinity,
              // height: double.infinity,
              child: Image(
            image: AssetImage(ImageAssets.map),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0,),
            child: Container(
              padding: EdgeInsets.all(16),
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'On the way',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                     Container(
                       padding: EdgeInsets.all(8),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(16),
                         border: Border.all(color: grey),
                       ),
                       child: Row(
                         children: [
                           Icon(Icons.access_time_filled_outlined , color: Colors.green,),
                           5.width,
                           Text('10 Min'),
                         ],
                       ),
                     )
                    ],
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Order placed',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                            ),
                          ),
                          10.height,
                          Container(
                            width: 100,
                            height: 7,
                            decoration: BoxDecoration(color: Colors.green),
                          ),
                        ],
                      ),
                      20.width,
                      Column(
                        children: [
                          Text(
                            'On the way',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          10.height,
                          Container(
                            width: 100,
                            height: 7,
                            decoration: BoxDecoration(color: Colors.grey),
                          ),
                        ],
                      ),
                      20.width,
                      Column(
                        children: [
                          Text(
                            'Delivered',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          10.height,
                          Container(
                            width: 100,
                            height: 7,
                            decoration: BoxDecoration(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  20.height,
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          ImageAssets.profilePic,
                        ),
                      ),
                      10.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your delivery hero',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          5.height,
                          Text(
                            'Abdulmalik Qasim ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        child: CircleAvatar(
                          backgroundColor: grey,
                          child: Icon(
                            Icons.chat,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      15.width,
                      InkWell(
                        child: CircleAvatar(
                          backgroundColor: grey,
                          child: Icon(
                            Icons.phone,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.height,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(
                      color: Colors.grey,
                      endIndent: 2,
                    ),
                  ),
                  10.height,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Address',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      10.height,
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.green,
                          ),
                          15.width,
                          Text(
                            'El-Galaa.st Thani,Assiut',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
