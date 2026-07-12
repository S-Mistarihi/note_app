import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/utils/app_assets.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _logoSize = 100;

  @override
  void initState() {
    super.initState();
    _increaseLogoSize();
    _navigateToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 3),
          curve: Curves.bounceIn,
          width: _logoSize,
          height: _logoSize,
          child: Lottie.asset(AppAssets.splashLogo),
        ),
      ),
    );
  }

  void _increaseLogoSize() async {
    await Future.delayed(Duration(milliseconds: 5));
    setState(() {
      _logoSize = 200;
    });
  }

  void _navigateToNextPage() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
