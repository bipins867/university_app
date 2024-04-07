import 'package:flutter/material.dart';
import 'package:university_app/Components/Home/UserLogin/user_login_page.dart';
import 'package:university_app/Components/Home/home_page.dart';

class HomeSplashScreen extends StatefulWidget {
  const HomeSplashScreen({super.key});

  @override
  State<HomeSplashScreen> createState() => _HomeSplashScreenState();
}

class _HomeSplashScreenState extends State<HomeSplashScreen> {
  @override
  void initState() {
    super.initState();
    _changeScreen();
  }

  _changeScreen() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const UserLoginPage(),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/Home/mmm-logo.png',
            height: 200,
          ),
        ),
      ),
    );
  }
}
