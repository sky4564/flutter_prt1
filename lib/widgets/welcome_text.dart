import 'package:flutter/material.dart';

class WelcomeT extends StatelessWidget {
  final String user;

  const WelcomeT({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              user,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Text(
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
