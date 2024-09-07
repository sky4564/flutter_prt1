import 'package:flutter/material.dart';
// import 'package:untitled/widgets/button.dart';/
import 'package:untitled/widgets/welcome_text.dart';
import 'package:untitled/services/api_service.dart';
import 'package:untitled/models/webtoon_model.dart';

/// what i learn
/// api 통신하는것과 통신결과를 플러터 인스터스 즉 클래스로 만드는것을 배움
/// Futrue 빌더를 통해서 stateful widget 을 안쓰고 비동기 통신 결과를
/// stateless widget에 나타낼수 있었고 이게 쫌 더 간편하고 직관적이여서
/// 이 모양을 많이 쓴다고함

/// problem
/// 1. 페이지가 많아지면 main dart 가 복잡해질꺼같다. 페이지별로 나누는법 배워보자(라우팅)
/// 2. api 통신한거 안드로이드 앱에서는 작동을 안하네.. 실제 apk 배포시 .. 원인파악해보기

/// todo
/// 1. 페이지별로 main dart 에 띄우는 방법 알아보기
/// 2. 실제 apk 배포시 api 통신작동안해서 무한로딩 원인파악해보기
/// A. 1,2 완료시 ui 가다듬어서 sb todo flutter 버전 제작

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  ///지금은 하나의 api 통신만 하는데
  ///여러개로 된다면 futurebuild 사용 할 수 있나 ?
  ///있다면 어떤식으로 ?
  Future<List<WebtoonModel>> webtoons = ApiService().getTodaysToons();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var webtoon = snapshot.data!;
            return MaterialApp(
              home: Scaffold(
                backgroundColor: const Color(0xFF181818),
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),

                      WelcomeT(user: webtoon[0].title),

                      const SizedBox(
                        height: 120,
                        width: 30,
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
