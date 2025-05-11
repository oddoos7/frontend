import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/menu_screen.dart';
import '../screens/review_screen.dart';
import '../screens/location_screen.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.menu:
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      case AppRoutes.review:
        return MaterialPageRoute(builder: (_) => const ReviewScreen());
      case AppRoutes.location:
        return MaterialPageRoute(builder: (_) => const LocationScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('페이지를 찾을 수 없습니다.')),
          ),
        );
    }
  }
}
