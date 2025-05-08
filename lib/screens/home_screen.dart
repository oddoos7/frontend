import 'package:flutter/material.dart';
import 'menu_screen.dart';
import 'location_screen.dart';
import 'review_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('홈')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const MenuScreen()));
              },
              child: const Text('메뉴 보기'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const LocationScreen()));
              },
              child: const Text('가게 위치 보기'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ReviewScreen()));
              },
              child: const Text('리뷰 보기'),
            ),
          ],
        ),
      ),
    );
  }
}
