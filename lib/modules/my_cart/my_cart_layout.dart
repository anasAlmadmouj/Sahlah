import 'package:flutter/material.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/modules/my_cart/history_view.dart';
import 'package:sahlah/modules/my_cart/my_cart_view.dart';
import 'package:sahlah/modules/notifications/notification_view.dart';
import 'package:sahlah/shared/local_storage/navigator_helper.dart';

class MyCartLayout extends StatelessWidget {
  const MyCartLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: AppBar(
            backgroundColor: Color(0xffF5F5F5),
            automaticallyImplyLeading: false,
            actions: [Padding(
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
            ),],
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
            bottom: TabBar(
              labelColor: Colors.green,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.green,

                tabs: [
              Tab(text: 'Cart' ,),
              Tab(text: 'History' ,),
            ]),
          ),
        ),
        body: TabBarView(children: [
          MyCartView(),
          MyHistoryView(),
        ]),
      ),
    );
  }
}
