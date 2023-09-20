import 'package:get/get.dart';
import 'package:spacex_rocketdetails/screens/rocket_homescreen.dart';

appRoutes() => [
      GetPage(
        name: 'rocketHomeScreen',
        page: () => const RocketHome(),
      ),
    ];
