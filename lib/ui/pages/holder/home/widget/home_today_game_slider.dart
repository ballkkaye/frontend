import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_today_game_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeTodatGameSlider extends StatefulWidget {
  const HomeTodatGameSlider({
    super.key,
  });

  @override
  State<HomeTodatGameSlider> createState() => _HomeTodatGameSliderState();
}

class _HomeTodatGameSliderState extends State<HomeTodatGameSlider> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselSliderController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
            carouselController: _carouselSliderController,
            options: CarouselOptions(
              aspectRatio: 328 / 160,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: HomeTodayGameCard(
                  gameState: '경기예정',
                  stadium: '고척',
                  gameTime: TimeOfDay(hour: 18, minute: 20),
                  broadcastInfo: 'SPO-2T',
                  leftPitcher: '화이트',
                  rightPitcher: '김윤하',
                  ticketUrl: '',
                ),
              );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return GestureDetector(
                  onTap: () => _carouselSliderController.animateToPage(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _currentIndex == index ? 16 : 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _currentIndex == index ? MColor.kPrimary.strong : MColor.kFill.normal,
                    ),
                  ));
            }),
          ),
        ],
      ),
    );
  }
}
