import 'package:flutter/material.dart';

class Welcome_T extends StatelessWidget {
  const Welcome_T({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Hey, Selena',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'Welcome back',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                fontSize: 18,
              ),
            ),
          ],
        )
      ],
    );
  }
}
