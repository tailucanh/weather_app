import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/services/app_assets.dart';
import 'package:weather_app/services/app_colors.dart';
import 'package:weather_app/services/app_helpers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double positionedHeight = 400;
  bool _isScroll = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          double delta = details.primaryDelta!;
          if (delta < 0) {
            setState(() {
              positionedHeight = MediaQuery.of(context).size.height / 1.16;
              _isScroll = true;
            });
          } else {
            setState(() {
              positionedHeight = 400;
              _isScroll = false;
            });
          }
        },
        child: Stack(
          children:[
            SizedBox(
              width: AppHelpers.getSizeWithDevice(context),
              height: AppHelpers.getSizeHeightDevice(context),
              child: Image.asset(AppAssets.imageBackground,
                width: AppHelpers.getSizeWithDevice(context),
                height: AppHelpers.getSizeHeightDevice(context),
                fit: BoxFit.fitHeight
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppHelpers.getSizeWithDevice(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Thanh Hoa",
                             textAlign: TextAlign.center,
                             maxLines: 1,
                             style: TextStyle(
                                 color: AppColors.light_primary,
                                 fontSize: 34,
                                 fontStyle: FontStyle.normal,
                                 fontFamily: AppHelpers.POPPINS_FONT),),
                        Text("19°",
                            style: TextStyle(
                                color: AppColors.light_primary,
                                fontSize: 96,
                                height: 1,
                                fontStyle: FontStyle.normal,
                                fontFamily: AppHelpers.POPPINS_FONT),),
                        Text("Mostly Clear",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(color: AppColors.light_secondary,
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              fontFamily: AppHelpers.POPPINS_FONT),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("H:24°",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(color: AppColors.light_primary,
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: AppHelpers.POPPINS_FONT),),
                            const SizedBox(width: 5,),
                            Text("L:18°",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(color: AppColors.light_primary,
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: AppHelpers.POPPINS_FONT),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: AppHelpers.getSizeWithDevice(context),
                    child: Image.asset(AppAssets.icHouse,
                        width:AppHelpers.getSizeWithDevice(context),),
                  )
                ],
              ),
            ),
            //UI weather
            AnimatedPositioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: positionedHeight,
              curve: Curves.easeInOut,
              duration:  const Duration(milliseconds: 300),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(44),
                    topRight: Radius.circular(44),
                  ),
                  gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.gradient_blue_600, AppColors.gradient_blue_800],
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(44),
                      topRight: Radius.circular(44),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.gradient_blue_600, AppColors.gradient_blue_800],
                    ),
                  ),
                ),
              ),
            ),
            //Bottom navigator
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: AppHelpers.getSizeWithDevice(context),
                  height: 120,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children:[
                      SizedBox(
                          child: Image.asset(AppAssets.icBottomBar,
                            fit: BoxFit.fitWidth,
                            width: AppHelpers.getSizeWithDevice(context),),
                      ),
                      SizedBox(
                        child: Image.asset(AppAssets.icSubtract,
                          fit: BoxFit.contain,
                          width: AppHelpers.getSizeWithDevice(context)/ 1.2,),
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [AppColors.gradient_black, AppColors.gradient_white],
                                  ),
                                ),
                              ),
                              Container(
                                width: 58,
                                height: 58,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [AppColors.gradient_white, AppColors.gradient_grey],
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                AppAssets.icPlus,
                                width: 44,
                                fit: BoxFit.contain,
                                colorFilter:const ColorFilter.mode(AppColors.color_plus, BlendMode.srcIn),),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 20,
                          left: 25,
                          child: InkWell(
                            onTap: () {

                            },
                            child: SvgPicture.asset(
                              AppAssets.icMap,
                              width: 50,
                              fit: BoxFit.contain,
                              colorFilter:const ColorFilter.mode(AppColors.light_primary, BlendMode.srcIn),),
                          ))
                  ]
                  ),
                ))
          ]
        ),
      ),
    );
  }
}
