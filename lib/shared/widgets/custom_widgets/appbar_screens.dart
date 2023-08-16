import 'package:flutter/material.dart';

class AppBarScreens extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const AppBarScreens({
    required this.title,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white70,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 25,
            color: Colors.black
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                onTap: () {},
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
    );
  }
}