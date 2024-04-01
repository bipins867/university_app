import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:university_app/Components/Home/home_page.dart';
import 'package:university_app/Components/SplashScreen/splash_screen.dart';
import 'package:university_app/Store/global_state_management.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => GlobalStateHandler(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MMM',
      home: HomeSplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
