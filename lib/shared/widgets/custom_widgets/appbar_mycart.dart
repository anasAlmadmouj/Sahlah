import 'package:flutter/material.dart';
import 'package:sahlah/constant/colors.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/modules/my_cart/my_cart_view.dart';
import 'package:sahlah/shared/local_storage/navigator_helper.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SliverAppBar(
        expandedHeight: 180,
        pinned: true,
        backgroundColor: grey,
        title: Row(
          children: [
            Expanded(
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
            Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: () {
                    navigateTo(context, MyCartView(),);
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
          ],
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 3),
            child: AppBar(
              bottom: TabBar(tabs: [
                Tab(text: 'Cart' ,),
                Tab(text: 'History' ,),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
