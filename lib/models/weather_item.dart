class WeatherItem{
  String uId;
  String strTime;
  String icon;
  String humidity;
  String temperature;

  WeatherItem(
      {
    required this.uId, required this.strTime,
    required this.icon, required this.humidity,
    required this.temperature
    }
  );

  factory WeatherItem.fromJson(Map<String, dynamic> json) => WeatherItem(
    uId: json["uId"],
    strTime: json["strTime"],
    icon: json["icon"],
    humidity: json["humidity"],
    temperature: json["temperature"],
  );

  Map<String, dynamic> toJson() => {
    "uId": uId,
    "strTime": strTime,
    "icon": icon,
    "humidity": humidity,
    "temperature": temperature,
  };
}