import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weather_app/models/weather_item.dart';
import 'package:weather_app/services/app_assets.dart';
import 'package:weather_app/services/app_language_constants.dart';
import 'package:weather_app/ui/widgets/weather_item_view.dart';

import 'app_colors.dart';
class AppHelpers {

  static String POPPINS_FONT = "Poppins";
  static String KEY_LIST_WEATHER_HOURLY = "LIST_WEATHER_HOURLY";
  static String KEY_LIST_WEATHER_WEEKLY = "LIST_WEATHER_WEEKLY";

  static String KEY_DETAIL_WEATHER = "detail_weather_screen";

  static double getSizeWithDevice(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double getSizeHeightDevice(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static bool isStringNotEmpty(String input) {
    if (input.isNotEmpty) {
      return true;
    }
    return false;
  }

  static bool isStringContains(String input,String value) {
    if (input.contains(value)) {
      return true;
    }
    return false;
  }

  static Widget uiLoading(BuildContext context, bool isLoading){
    return  isLoading ? SizedBox(
      width: AppHelpers.getSizeWithDevice(context),
      height: AppHelpers.getSizeHeightDevice(context),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Center(
          child: LoadingAnimationWidget.dotsTriangle(
            color: AppColors.color_loading,
            size: 100,
          ),
        ),
      ),
    ): const SizedBox();
  }

  static popupPermission({required BuildContext context, required VoidCallback onAllow}){
      showDialog(
          context: context,
          //barrierDismissible: false,
          builder:(BuildContext context){
            return AlertDialog(
              content: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppAssets.icLocation,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    Text(translation(context).title_dialog_location,
                      style: TextStyle(
                          color: AppColors.dark_primary,
                          fontSize: 20,
                          height: 1,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppHelpers.POPPINS_FONT),),
                    const SizedBox(height: 15),
                    Text(translation(context).description_dialog_location,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.dark_secondary,
                          fontSize: 16,
                          height: 1,
                          fontStyle: FontStyle.normal,
                          fontFamily: AppHelpers.POPPINS_FONT),),
                    Container(
                      width: AppHelpers.getSizeWithDevice(context),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [AppColors.gradient_blue_5, AppColors.gradient_purple_3],
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: onAllow,
                        style:  ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          backgroundColor: AppColors.color_white_0
                        ),
                        child: Text(translation(context).text_allow,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.light_primary,
                              fontSize: 16,
                              height: 1,
                              fontStyle: FontStyle.normal,
                              fontFamily: AppHelpers.POPPINS_FONT),),
                      ),
                    ),
                    Container(
                      width: AppHelpers.getSizeWithDevice(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.color_border, width: 2)
                      ),
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style:  ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        child: Text(translation(context).text_skip,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.dark_primary,
                              fontSize: 16,
                              height: 1,
                              fontStyle: FontStyle.normal,
                              fontFamily: AppHelpers.POPPINS_FONT),),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
      );
  }


  static List<WeatherItem> lisDataDemo (){
      return <WeatherItem>[
        WeatherItem(uId: "1", strTime: "12AM", icon: AppAssets.icMoonCloudFastWind, address: "Thanh Hoa, VN", description: "Mid Rain",
            humidity: "30%", temperature: "19°", highPressure: "24°",lowPressure: "19°"),
        WeatherItem(uId: "2", strTime: "Now", icon: AppAssets.icMoonCloudMidRain, address: "Thanh Hoa, VN", description: "Fast Win",
            humidity: "", temperature: "19°", highPressure: "",lowPressure: ""),
        WeatherItem(uId: "3", strTime: "2AM", icon: AppAssets.icMoonCloudMidRain, address: "Thanh Hoa, VN", description: "Showers",
            humidity: "", temperature: "19°", highPressure: "24°",lowPressure: "19°"),
        WeatherItem(uId: "4", strTime: "3AM", icon: AppAssets.icMoonCloudMidRain, address: "Thanh Hoa, VN", description: "Fast Win",
            humidity: "", temperature: "19°", highPressure: "24°",lowPressure: "19°"),
        WeatherItem(uId: "5", strTime: "4AM", icon: AppAssets.icMoonCloudFastWind, address: "Thanh Hoa, VN", description: "Mid Rain",
            humidity: "", temperature: "19°", highPressure: "",lowPressure: ""),
        WeatherItem(uId: "6", strTime: "4AM", icon: AppAssets.icMoonCloudFastWind, address: "Thanh Hoa, VN", description: "Mid Rain",
            humidity: "", temperature: "19°", highPressure: "24°",lowPressure: "19°"),
        WeatherItem(uId: "7", strTime: "4AM", icon: AppAssets.icMoonCloudMidRain, address: "Thanh Hoa, VN", description: "Showers",
            humidity: "", temperature: "19°", highPressure: "24°",lowPressure: "19°"),
      ];
  }
  static List<WeatherItem> lisDataDemo2 (){
    return <WeatherItem>[
      WeatherItem(uId: "1", strTime: "Mon", icon: AppAssets.icSunCloudAngledRain, address: "Thanh Hoa, VN", description: "Mid Rain",
          humidity: "30%", temperature: "19°",highPressure: "24°",lowPressure: "19°"),
      WeatherItem(uId: "2", strTime: "TUE", icon: AppAssets.icMoonCloudMidRain, address: "Thanh Hoa, VN", description: "Fast Win",
          humidity: "", temperature: "25°", highPressure: "",lowPressure: ""),
      WeatherItem(uId: "3", strTime: "WES", icon: AppAssets.icTornado, address: "Thanh Hoa, VN", description: "Showers",
          humidity: "", temperature: "22°", highPressure: "24°",lowPressure: "19°"),
      WeatherItem(uId: "4", strTime: "THU", icon: AppAssets.icSunCloudMidRain,address: "Thanh Hoa, VN", description: "Fast Win",
          humidity: "100%", temperature: "19°", highPressure: "24°",lowPressure: "19°"),
      WeatherItem(uId: "5", strTime: "Fri", icon: AppAssets.icMoonCloudFastWind,address: "Thanh Hoa, VN", description: "Mid Rain",
          humidity: "", temperature: "19°", highPressure: "",lowPressure: ""),
      WeatherItem(uId: "6", strTime: "SAT", icon: AppAssets.icMoonCloudFastWind, address: "Thanh Hoa, VN", description: "Mid Rain",
          humidity: "", temperature: "20°", highPressure: "24°",lowPressure: "19°"),
      WeatherItem(uId: "7", strTime: "SUN", icon: AppAssets.icMoonCloudFastWind, address: "Thanh Hoa, VN", description: "Showers",
          humidity: "", temperature: "19°", highPressure: "24°",lowPressure: "19°"),
    ];
  }
}
