import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/home/home_screen_navigator.dart';
import 'package:weather_app/ui/home/home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final HomeScreenNavigator navigator;

  HomeScreenCubit({
    required this.navigator,
  }) : super(HomeScreenState());

  Future<void> getLocation() async {
    try {
    } on Exception {

    }
  }
}