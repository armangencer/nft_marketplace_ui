import 'package:flutter/material.dart';
import 'package:nft_marketplace_ui/app/theme/light_theme.dart';
import 'screens/home_screen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'NFTs',
      debugShowCheckedModeBanner: false,
      //theme: CustomTheme.lightTheme,

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
