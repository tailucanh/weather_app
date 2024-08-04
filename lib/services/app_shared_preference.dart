import 'package:shared_preferences/shared_preferences.dart';

late AppSharedPreference appSharedPreference;

class AppSharedPreference{
  SharedPreferences? _pref;

  static const String KEY_USE_GROUP_EVENT = "user_use_group_event";
  static const String KEY_SORT_EVENTS = "sort_events";
  static const String KEY_LAYOUT_EVENT = "layout_event";
  static const String KEY_HIDE_PASS_EVENT = "hide_pass_event";
  static const String KEY_HIDE_ICON_EVENT = "hide_icon_event";
  static const String KEY_IS_NOTIFICATION_EVENT = "is_notification_event";
  static const String KEY_PUSH_NOTIFICATION_EVENT = "is_push_notification_event";
  static const String KEY_PUSH_NOTIFICATION_EVENT_100_DAY = "is_push_notification_event_100_day";

  static const String KEY_TIME_PUSH_DAY_EVENT = "time_push_notification_day_event";
  static const String KEY_IS_PUSH_DAY_EVENT = "is_push_notification_day_event";

  static const String KEY_TIME_PUSH_BEFORE_1_DAY = "time_push_notification_before_1_day";
  static const String KEY_IS_PUSH_BEFORE_1_DAY= "is_push_notification_before_1_day";

  static const String KEY_TIME_PUSH_BEFORE_3_DAY = "time_push_notification_before_3_day";
  static const String KEY_IS_PUSH_BEFORE_3_DAY = "is_push_notification_before_3_day";

  static Future<dynamic> getInstance() async {
    var preferences = AppSharedPreference();
    preferences._pref = await SharedPreferences.getInstance();
    return preferences;
  }

}