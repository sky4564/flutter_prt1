import 'package:flutter/material.dart';
// import 'package:untitled/widgets/button.dart';/
import 'package:untitled/widgets/welcome_text.dart';
import 'package:untitled/services/api_service.dart';
import 'package:untitled/models/webtoon_model.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  Future<List<WebtoonModel>> webtoons = ApiService().getTodaysToons();
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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

                      SizedBox(
                        height: 120,
                        width: 30,
                      ),

                      Text(
                        'Total Balance',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 100, 58, 58),
                        ),
                      ),

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
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
