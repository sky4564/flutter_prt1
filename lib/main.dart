import 'package:flutter/material.dart';
import 'package:untitled/services/api_service.dart';
// import 'package:untitled/widgets/button.dart';/
import 'package:untitled/widgets/welcometext.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF181818),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),

              WelcomeT(user: 'kaki'),

              // const SizedBox(
              //   height: 120,
              //   width: 30,
              // ),

              // Text(
              //   'Total Balance',
              //   style: TextStyle(
              //     fontSize: 22,
              //     color: Colors.white.withOpacity(0.8),
              //   ),
              // ),

              // SizedBox(
              //   height: 5,
              // ),

              // Text(
              //   '\$5 194 482',
              //   style: TextStyle(
              //     fontSize: 48,
              //     fontWeight: FontWeight.w600,
              //     color: Colors.white,
              //   ),
              // ),

              // SizedBox(
              //   height: 30,
              // ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Button(
              //       text: 'Transfer',
              //       bgColor: Color(0xFFF1B33B),
              //       textColor: Colors.black,
              //     ),
              //     Button(
              //       text: 'Request',
              //       bgColor: Color(0xFF1F2123),
              //       textColor: Colors.white,
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
