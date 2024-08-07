import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_item.dart';
import 'package:weather_app/services/app_colors.dart';
import 'package:weather_app/services/app_helpers.dart';
import 'package:weather_app/ui/widgets/trapezoid_painter.dart';

class WeatherBoxView extends StatefulWidget {
  const WeatherBoxView({super.key,
    required this.data, this.onTap});

  final WeatherItem data;
  final Function()? onTap;
  @override
  State<WeatherBoxView> createState() => _WeatherBoxViewState();
}

class _WeatherBoxViewState extends State<WeatherBoxView> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppHelpers.getSizeWithDevice(context),
      height: 185,
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TrapezoidContainer(
            width: AppHelpers.getSizeWithDevice(context),
            topHeight: 75,
            bottomHeight: 170,
            borderRadius: 30,
            gradient: const LinearGradient(
              colors: [AppColors.gradient_purrple_2, AppColors.gradient_blue_4],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(widget.data.icon, width: 160, fit: BoxFit.cover,)),
          Positioned(
            top: 30,
            left: 20,
            child: SizedBox(
              width: AppHelpers.getSizeWithDevice(context) / 2,
              height: 185,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(widget.data.temperature,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(color: AppColors.light_primary,
                          fontSize: 60,
                          fontStyle: FontStyle.normal,
                          fontFamily: AppHelpers.POPPINS_FONT),),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(AppHelpers.isStringNotEmpty(widget.data.highPressure) ? "H:${widget.data.highPressure}" : "",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(color: AppColors.light_secondary,
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontFamily: AppHelpers.POPPINS_FONT),),
                      const SizedBox(width: 5,),
                      Text(AppHelpers.isStringNotEmpty(widget.data.lowPressure) ? "H:${widget.data.lowPressure}" : "",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(color: AppColors.light_secondary,
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontFamily: AppHelpers.POPPINS_FONT),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(widget.data.address,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(color: AppColors.light_primary,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontFamily: AppHelpers.POPPINS_FONT),),
                  ),
                ],
              ),
            )
          ),

          Positioned(
            bottom: 15,
            right: 25,
            child: SizedBox(
              width: AppHelpers.getSizeWithDevice(context) / 3,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerRight,
                child: Text(widget.data.description,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  style: TextStyle(color: AppColors.light_primary,
                      fontSize: 13,
                      fontStyle: FontStyle.normal,
                      fontFamily: AppHelpers.POPPINS_FONT),),
              ),
            )
          )
        ],
      ),
    );
  }
}
