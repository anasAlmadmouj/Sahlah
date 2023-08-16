import 'package:sahlah/app_layout/app_layout.dart';
import 'package:sahlah/constant/colors.dart';
import 'package:sahlah/constant/image_assets/image_assets.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/models/profile_model.dart';
import 'package:sahlah/modules/login/login.dart';
import 'package:sahlah/modules/notifications/notification_view.dart';
import 'package:sahlah/shared/local_storage/navigator_helper.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      navigateTo(
                        context,
                        NotificationsView(),
                      );
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  backgroundImage: AssetImage(ImageAssets.profilePic),
                ),
                20.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ayman Atta',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    10.height,
                    Text(
                      'El-Galaa.st ,Assiut',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: grey,
                  child: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  leading: Icon(
                    profileList[index].icon,
                    color: Colors.grey,
                  ),
                  title: Text(
                    profileList[index].name,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: index == 6
                      ? Switch(
                          value: isDark,
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          onChanged: (val) {
                            setState(() {
                              isDark = val;
                            });
                          })
                      : IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward_ios_outlined),
                          color: Colors.grey,
                        ),
                ),
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey,
                  endIndent: 1,
                ),
                itemCount: profileList.length,
              ),
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    navigateToAndRemoveUntil(context, LogInScreen());
                  },
                  icon: Icon(
                    Icons.logout_outlined,
                    color: Colors.green,
                  ),
                  label: Text('Logout' , style: TextStyle(color: Colors.grey,fontSize: 15),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
