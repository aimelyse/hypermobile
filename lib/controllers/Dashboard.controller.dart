import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hypemobile/screens/Home.screen.dart';

import '../screens/Profile.screen.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  Widget? pageCaller(int index) {
    switch (index) {
      case 0:
        return const HomeScreen(); // Use HomeScreen as the first tab
      case 1:
        return HomeScreen(); // Replace with your second tab screen
      case 2:
        return HomeScreen(); // Replace with your third tab screen
      case 3:
        return ReviewerProfileScreen(
          reviewerName: 'Name01',
          reviewerImage: 'assets/images/cat1.png',
          reviewerLevel: '골드',
          reviewerBio: '조립컴 업체를 운영하며 리뷰를 작성합니다.',
          reviews: const [
            {
              'productName': 'AMD 라이젠 5 5600X 버미어 정품 멀티팩',
              'productImage': 'assets/images/tv1.png',
              'rating': 4.07,
              'date': '2022.12.09',
              'reviewText': '멀티 작업도 잘 되고 꽤 괜찮습니다. 저희 회사 고객님들에게도 추천 가능한 제품인 듯 합니다.',
              'reviewText2': '3600에서 바꾸니 체감이 살짝 되네요. 버라이어티한 느낌 까지는 아닙니다.',
              'tags': ['가격 저렴해요', 'CPU온도 고온', '서멀작업 가능해요', '게임 잘 돌아가요'],
              'images': [
                'assets/images/tv1.png',
                'assets/images/tv1.png',
                'assets/images/tv1.png',
              ],
            },
            // Add more reviews here...
          ],
        );
      default:
        return null;
    }
  }
}
