import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/_core/utils/m_util.dart';
import 'package:ballkkaye_frontend/data/enum/game_status.dart';
import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_today_game_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeTodayGameSlider extends StatefulWidget {
  final List<Game> games;

  const HomeTodayGameSlider({
    super.key,
    required this.games,
  });

  @override
  State<HomeTodayGameSlider> createState() => _HomeTodayGameSliderState();
}

class _HomeTodayGameSliderState extends State<HomeTodayGameSlider> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
            carouselController: _carouselSliderController,
            options: CarouselOptions(
              height: 248,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: widget.games.map((game) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: HomeTodayGameCard(
                  gameState: game.gameStatus?.label ?? '경기 예정',
                  stadium: game.stadiumName,
                  gameTime: parseGameTime(game.gameTime ?? '00:00'),
                  broadcastInfo: game.broadcastChannel,
                  leftPitcher: game.awayPitcherName,
                  rightPitcher: game.homePitcherName,
                  ticketUrl: game.ticketLink,
                  leftPhotoUrl: game.awayTeam.teamLogo,
                  rightPhotoUrl: game.homeTeam.teamLogo,
                ),
              );
            }).toList(),
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
                    margin:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _currentIndex == index
                          ? MColor.kPrimary.strong
                          : MColor.kFill.normal,
                    ),
                  ));
            }),
          ),
        ],
      ),
    );
  }
}
