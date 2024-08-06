import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_item.dart';
import 'package:weather_app/services/app_assets.dart';
import 'package:weather_app/ui/widgets/weather_item_view.dart';
class AppHelpers {

  static String POPPINS_FONT = "Poppins";
  static String KEY_LIST_WEATHER_HOURLY = "LIST_WEATHER_HOURLY";
  static String KEY_LIST_WEATHER_WEEKLY = "LIST_WEATHER_WEEKLY";

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
  static List<WeatherItem> lisDataDemo (){
      return <WeatherItem>[
        WeatherItem(uId: "1", strTime: "12AM", icon: AppAssets.icMoonCloudFastWind,humidity: "30%", temperature: "19°",),
        WeatherItem(uId: "2", strTime: "Now", icon: AppAssets.icMoonCloudMidRain,humidity: "", temperature: "19°",),
        WeatherItem(uId: "3", strTime: "2AM", icon: AppAssets.icMoonCloudMidRain,humidity: "", temperature: "19°",),
        WeatherItem(uId: "4", strTime: "3AM", icon: AppAssets.icMoonCloudMidRain,humidity: "", temperature: "19°",),
        WeatherItem(uId: "5", strTime: "4AM", icon: AppAssets.icMoonCloudFastWind,humidity: "", temperature: "19°",),
        WeatherItem(uId: "6", strTime: "4AM", icon: AppAssets.icMoonCloudFastWind,humidity: "", temperature: "19°",),
        WeatherItem(uId: "7", strTime: "4AM", icon: AppAssets.icMoonCloudMidRain,humidity: "", temperature: "19°",),
      ];
  }
  static List<WeatherItem> lisDataDemo2 (){
    return <WeatherItem>[
      WeatherItem(uId: "1", strTime: "Mon", icon: AppAssets.icSunCloudAngledRain,humidity: "30%", temperature: "19°",),
      WeatherItem(uId: "2", strTime: "TUE", icon: AppAssets.icMoonCloudMidRain,humidity: "", temperature: "25°",),
      WeatherItem(uId: "3", strTime: "WES", icon: AppAssets.icTornado,humidity: "", temperature: "22°",),
      WeatherItem(uId: "4", strTime: "THU", icon: AppAssets.icSunCloudMidRain,humidity: "100%", temperature: "19°",),
      WeatherItem(uId: "5", strTime: "Fri", icon: AppAssets.icMoonCloudFastWind,humidity: "", temperature: "19°",),
      WeatherItem(uId: "6", strTime: "SAT", icon: AppAssets.icMoonCloudFastWind,humidity: "", temperature: "20°",),
      WeatherItem(uId: "7", strTime: "SUN", icon: AppAssets.icMoonCloudFastWind,humidity: "", temperature: "19°",),
    ];
  }
}
