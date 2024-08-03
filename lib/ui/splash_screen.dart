import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(Duration(seconds: 3), () {
        context.go('/auth_screen');
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;

    return  Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Text('Copy right ©2023 - ${currentYear} . All rights reserved.',
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          /*child: Image.asset(AppAssets.icLogoApp,
            width: 150,
            height: 150,
            fit: BoxFit.cover,),*/
        ),
      ),
    );
  }
}
