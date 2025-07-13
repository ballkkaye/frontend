import 'package:ballkkaye_frontend/_core/style/m_color.dart';
import 'package:ballkkaye_frontend/data/model/game.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/game_center/prediction_page/prediction_vm.dart';
import 'package:ballkkaye_frontend/ui/pages/holder/home/widget/home_prdiction_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePredictionSlider extends StatefulWidget {
  final List<PredictionGame> games;

  const HomePredictionSlider({
    super.key,
    required this.games,
  });

  @override
  State<HomePredictionSlider> createState() => _HomePredictionSliderState();
}

class _HomePredictionSliderState extends State<HomePredictionSlider> {
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
              height: 412,
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
                child: HomePredictionCard(predictionGame: game),
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
