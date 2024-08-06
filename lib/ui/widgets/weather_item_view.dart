import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_item.dart';
import 'package:weather_app/services/app_colors.dart';
import 'package:weather_app/services/app_helpers.dart';

class WeatherItemView extends StatefulWidget {
  const WeatherItemView({super.key,
    required this.data, required this.colorBackground,required this.colorStroke,
    this.onTap});

  final WeatherItem data;
  final Color colorBackground;
  final Color colorStroke;
  final Function()? onTap;
  @override
  State<WeatherItemView> createState() => _WeatherItemViewState();
}

class _WeatherItemViewState extends State<WeatherItemView> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 150,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
        color: widget.colorBackground,
        border: Border.all(color: widget.colorStroke, width: 1),
        boxShadow: const [
          BoxShadow(
            color: AppColors.color_white_20,
            blurRadius: 2,
            offset: Offset(0.3, -0.5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.data.strTime.toUpperCase(),
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(color: AppColors.light_primary,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: AppHelpers.POPPINS_FONT),
          ),
          SizedBox(
            child: Column(
              children: [
                Image.asset(widget.data.icon,
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover
                ),
                Text(widget.data.humidity,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(color: AppColors.color_humidity,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppHelpers.POPPINS_FONT),
                ),
              ],
            ),
          ),
          Text(widget.data.temperature,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(color: AppColors.light_primary,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: AppHelpers.POPPINS_FONT),
          ),
        ],
      ),
    );
  }
}
