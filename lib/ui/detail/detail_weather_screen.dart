import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/services/app_assets.dart';
import 'package:weather_app/services/app_colors.dart';
import 'package:weather_app/services/app_helpers.dart';
import 'package:weather_app/ui/widgets/weather_box_view.dart';
import 'package:weather_app/ui/widgets/weather_item_view.dart';

class DetailWeatherScreen extends StatefulWidget {
  const DetailWeatherScreen({super.key});

  @override
  _DetailWeatherScreenState createState() => _DetailWeatherScreenState();
}

class _DetailWeatherScreenState extends State<DetailWeatherScreen> {
  bool _isScroll = false;
  bool _isTabSelected = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.gradient_purrple, AppColors.gradient_blue_3],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _uiTemperature(context),
              _uiBoxWeather(),
            ]
        ),
      ),
    );
  }

  Widget _uiTemperature(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        context.go('/')
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 30, left: 15, right: 15),
        child: SizedBox(
          width: AppHelpers.getSizeWithDevice(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Thanh Hoa",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                      color: AppColors.light_primary,
                      fontSize: 34,
                      fontStyle: FontStyle.normal,
                      fontFamily: AppHelpers.POPPINS_FONT),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("19°",
                    style: TextStyle(
                        color: AppColors.light_primary,
                        fontSize: 20,
                        height: 1,
                        fontStyle: FontStyle.normal,
                        fontFamily: AppHelpers.POPPINS_FONT),),
                  Text(" | ",
                    style: TextStyle(
                        color: AppColors.light_primary,
                        fontSize: 20,
                        height: 1,
                        fontStyle: FontStyle.normal,
                        fontFamily: AppHelpers.POPPINS_FONT),),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text("Mostly Clear",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(color: AppColors.light_secondary,
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontFamily: AppHelpers.POPPINS_FONT),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _uiBoxWeather() {
    return Expanded(
      child: ClipRRect(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [AppColors.color_white_0, AppColors.light_primary, AppColors.color_white_0],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.color_black_30
              ),
            ),
            //App bar
            Container(
              margin: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: AppColors.light_tertiary, width: 1)
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isTabSelected = true;
                        });
                      },
                      child: SizedBox(
                        width: AppHelpers.getSizeWithDevice(context) / 2 -
                            15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text("Hourly Forecast",
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: AppColors.light_secondary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppHelpers.POPPINS_FONT),
                                ),
                              ),
                            ),
              
                            _isTabSelected ? Container(
                              margin: const EdgeInsets.only(top: 8),
                              width: AppHelpers.getSizeWithDevice(context) /
                                  2 - 15,
                              height: 3,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColors.color_white_0,
                                    AppColors.light_primary,
                                    AppColors.color_white_0
                                  ],
                                ),
                              ),
                            ) : SizedBox(
                              height: 11,
                              width: AppHelpers.getSizeWithDevice(context) /
                                  2 - 15,
                            ),
                          ],
                        ),
                      ),
              
                    ),
              
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isTabSelected = false;
                        });
                      },
                      child: SizedBox(
                        width: AppHelpers.getSizeWithDevice(context) / 2 -
                            15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text("Weekly Forecast",
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: AppColors.light_secondary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppHelpers.POPPINS_FONT),
                                ),
                              ),
                            ),
                            !_isTabSelected ? Container(
                              margin: const EdgeInsets.only(top: 8),
                              width: AppHelpers.getSizeWithDevice(context) /
                                  2 - 15,
                              height: 3,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  tileMode: TileMode.mirror,
                                  colors: [
                                    AppColors.color_white_0,
                                    AppColors.light_primary,
                                    AppColors.color_white_0
                                  ],
                                ),
                              ),
                            ) : SizedBox(
                              height: 11,
                              width: AppHelpers.getSizeWithDevice(context) /
                                  2 - 15,
                            ),
                          ],
                        ),
                      ),
              
                    ),
                  ],
                ),
              ),
            ),
            // UI list
            _isTabSelected
                ? _uiListWeatherHourly()
                : _uiListWeatherWeekly(),
          ],
        ),
      ),
    );
  }

  Widget _uiListWeatherHourly() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListView.builder(
              key: Key(AppHelpers.KEY_LIST_WEATHER_HOURLY),
              shrinkWrap: true,
              itemCount: AppHelpers
                  .lisDataDemo()
                  .length,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return WeatherBoxView(
                    onTap: () {},
                    data: AppHelpers.lisDataDemo()[index]);
              },

            ),
          ],
        ),
      ),
    );
  }

  Widget _uiListWeatherWeekly() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListView.builder(
              key: Key(AppHelpers.KEY_LIST_WEATHER_HOURLY),
              shrinkWrap: true,
              itemCount: AppHelpers
                  .lisDataDemo2()
                  .length,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return WeatherBoxView(
                    onTap: () {},
                    data: AppHelpers.lisDataDemo2()[index]);
              },

            ),
          ],
        ),
      ),
    );
  }
}

