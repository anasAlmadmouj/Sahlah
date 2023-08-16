import 'package:flutter/material.dart';
import 'package:sahlah/constant/image_assets/image_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.startWidget}) : super(key: key);
  final Widget startWidget;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget.startWidget));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.splash),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
