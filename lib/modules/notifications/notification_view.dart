import 'package:flutter/material.dart';
import 'package:sahlah/models/notifications.dart';
import 'package:sahlah/shared/local_storage/navigator_helper.dart';
import 'package:sahlah/shared/widgets/custom_widgets/appbar_screens.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBarScreens(
          title: 'Notification',
          onPressed: (){
            maybePop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            leading: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff23AA49),
              ),
            ),
            title: Text(
              notificationsList[index].message,
              style: TextStyle(fontSize: 16,),
            ),
            subtitle: Text(
              notificationsList[index].time,
              style: TextStyle(fontSize: 12,color: Color(0xffB6B7B7)),
            ),
          ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: notificationsList.length,
        ),
      ),
    );
  }
}
