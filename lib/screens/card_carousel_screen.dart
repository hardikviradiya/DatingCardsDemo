import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/capsule_widget.dart';
import '../widgets/no_photo_card.dart';
import '../widgets/photo_card.dart';
import '../widgets/photo_card_2.dart';
import '../widgets/photo_card_3.dart';

class CardCarouselScreen extends StatefulWidget {
  const CardCarouselScreen({super.key});

  @override
  State<CardCarouselScreen> createState() => _CardCarouselScreenState();
}

class _CardCarouselScreenState extends State<CardCarouselScreen> {
  var _initialPage = 0;
  CarouselController carouselController = CarouselController();
  final List<Widget> _cards = [
    const PhotoCard(),
    const PhotoCard2(),
    const PhotoCard3(),
    const PhotoCard3(),
    const PhotoCard3()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0D0D),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 50.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(icLocation),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "목이길어슬픈기린님의 새로운 스팟",
                    style: TextStyle(
                        color: const Color(0xFFFCFCFC),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
              Row(
                children: [
                  const CapsuleWidget(icon: icStar, text: "323,233"),
                  SvgPicture.asset(
                    icNotification,
                    height: 35.h,
                    width: 32.h,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Stack(children: [
          _cards.isNotEmpty
              ? CarouselSlider.builder(
                  itemCount: _cards.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    final item = _cards[itemIndex];
                    return GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        double screenWidth = MediaQuery.of(context).size.width;
                        if (details.globalPosition.dx < screenWidth / 2) {
                          if (_initialPage > 0) {
                            setState(() {
                              _initialPage = _initialPage - 1;
                              carouselController.previousPage();
                            });
                          }
                        } else {
                          if (_initialPage < (_cards.length - 1)) {
                            setState(() {
                              _initialPage = _initialPage + 1;
                              carouselController.nextPage();
                            });
                          }
                        }
                      },
                      child: Dismissible(
                          direction: DismissDirection.endToStart,
                          key: Key(item.toString() +
                              itemIndex.toString() +
                              Random().nextInt(100).toString()),
                          // Unique key for each item
                          onDismissed: (direction) {
                            // Remove the item from the list when dismissed
                            setState(() {
                              removeCard(itemIndex);
                            });

                            // Show a snackbar to indicate item removal
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('$item dismissed'),
                              ),
                            );
                          },
                          background: Container(
                            color: Colors.red.shade300,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            // Background color when swiping
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 36.h,
                            ),
                          ),
                          child: Dismissible(
                              direction: DismissDirection.down,
                              key: Key(item.toString() +
                                  itemIndex.toString() +
                                  Random().nextInt(100).toString()),
                              // Unique key for each item
                              onDismissed: (direction) {
                                // Remove the item from the list when dismissed
                                setState(() {
                                  removeCard(itemIndex);
                                });

                                // Show a snackbar to indicate item removal
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('$item dismissed'),
                                  ),
                                );
                              },
                              background: Container(
                                color: Colors.red.shade300,
                                alignment: Alignment.topCenter,
                                padding: const EdgeInsets.only(right: 20),
                                // Background color when swiping
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 36.h,
                                ),
                              ),
                              child: _cards[itemIndex])),
                    );
                  },
                  carouselController: carouselController,
                  options: CarouselOptions(
                    height: 650.h,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    initialPage: _initialPage,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: false,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ))
              : const NoPhotoCard(),
          _cards.isNotEmpty
              ? Positioned(
                  top: 16.h,
                  left: 0,
                  right: 0,
                  child: DotsIndicator(
                    dotsCount: _cards.length,
                    position: _initialPage,
                    decorator: DotsDecorator(
                      color: const Color(0xFF202020),
                      activeColor: const Color(0xFFFF0E73),
                      size: const Size(57.0, 3),
                      activeSize: const Size(57.0, 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ))
              : const SizedBox.shrink(),
        ])
      ]),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  removeCard(int index) {
    _cards.removeAt(index);
    if (_initialPage > (_cards.length - 1)) {
      if (_initialPage > 0) {
        _initialPage = _initialPage - 1;
      }
    }
  }
}
