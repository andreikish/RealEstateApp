import 'package:flutter/material.dart';
import 'package:workshoparrkrealestate/features/home/ui/desktop/home_desktop_page.dart';
import 'package:workshoparrkrealestate/features/home/ui/mobile/home_mobile_page.dart';
import 'package:workshoparrkrealestate/responsive/responsive_layout.dart';
import 'responsive/responsive_layout.dart';
import 'features/home/ui/desktop/home_desktop_page.dart';
import 'features/home/ui/mobile/home_mobile_page.dart';

void main() {
  runApp(RealEstateApp());
}

class RealEstateApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Real Estate App',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ResponsiveLayout(mobilePage: HomeMobilePage(), desktopPage: HomeDesktopPage()),
    );
  }
}

