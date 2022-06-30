import 'dart:isolate';

import 'package:algoriza_first_test/modules/login_screen.dart';
import 'package:algoriza_first_test/modules/register_screen.dart';
import 'package:algoriza_first_test/shared/component/components.dart';
import 'package:algoriza_first_test/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shared/component/widgets/default_button_widget.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String content;

  OnBoardingModel(this.image, this.title, this.content);
}

bool isLast = false;

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  PageController pgController = PageController();

  List<OnBoardingModel> OnBoardingItems = [
    OnBoardingModel(
        'assets/images/d2.png',
        'Get food Delivery to your \n doorstep asap',
        'we have young and professional delivery team that will bring your food as soon as possible to your doorsteep '),
    OnBoardingModel(
        'assets/images/d1.png',
        'Buy any food from your \n favourite restaurant ',
        'we are constantly adding your favourite restaurant throughout the territory and arround your area carefully selected'),
    OnBoardingModel(
        'assets/images/d3.png',
        'Buy any food from your \n favourite restaurant ',
        'we are constantly adding your favourite restaurant throughout the territory and arround your area carefully selected'),
  ];
  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top);
    return Scaffold(
      appBar: AppBar(
        actions: const [buildSkipButton()],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        //pageView
        Container(
          height: height * .7,
          child: buildPageView(
            OnBoardingItems: OnBoardingItems,
            controller: pgController,
          ),
        ),
        //below pageview
        Container(
          height: height * .3,
          child: LayoutBuilder(
              builder: (context, constraints) => Column(
                    children: [
                      //indicitor
                      Container(
                        height: constraints.maxHeight * .05,
                        child: SmoothPageIndicator(
                            controller: pgController,
                            count: OnBoardingItems.length,
                            axisDirection: Axis.horizontal,
                            effect: ExpandingDotsEffect(
                                spacing: 4,
                                radius: 10,
                                dotWidth: 15,
                                dotHeight: 5.0,
                                activeDotColor: HexColor('#f1c517'))),
                      ),
                      SizedBox(height: constraints.maxHeight * .05),
                      //next Button
                      Container(
                        height: constraints.maxHeight * .5,
                        padding: const EdgeInsets.all(8.0),
                        child: DefaultButton(
                          text: "Next",
                          color: buttonColor,
                          radius: 10,
                          onpressed: () {
                            if (isLast) {
                              push(context, LoginScreen());
                            } else {
                              pgController.nextPage(
                                  duration: Duration(microseconds: 750),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            }
                          },
                        ),
                      ),
                      Container(
                        height: constraints.maxHeight * .3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                  push(context, RegisterScreen());
                                },
                                child: Text(
                                  "sign Up",
                                  style: TextStyle(
                                      color: buttonColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      )
                    ],
                  )),
        )
      ]),
    );
  }
}

class buildSkipButton extends StatelessWidget {
  const buildSkipButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          //  onPrimary: Colors.white,
          primary: buttonColor,
          minimumSize: const Size(80, 30),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
        onPressed: () {
          push(context, RegisterScreen());
        },
        child: const Text(
          "skip",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class buildPageView extends StatelessWidget {
  const buildPageView(
      {Key? key, required this.OnBoardingItems, required this.controller})
      : super(key: key);

  final List<OnBoardingModel> OnBoardingItems;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxContraint) => PageView.builder(
          onPageChanged: (value) {
            if (value == OnBoardingItems.length - 1) {
              isLast = true;
            } else
              isLast = false;
          },
          controller: controller,
          itemCount: OnBoardingItems.length,
          itemBuilder: (context, index) {
            return Column(children: [
              Image(
                width: double.infinity,
                height: boxContraint.maxHeight * .5,
                image: AssetImage(OnBoardingItems[index].image),
              ),
              Container(
                height: boxContraint.maxHeight * .2,
                child: Text(
                  OnBoardingItems[index].title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold, height: 1.5),
                ),
              ),
              Container(
                height: boxContraint.maxHeight * .3,
                child: Text(
                  OnBoardingItems[index].content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: Colors.grey[500]),
                ),
              ),
            ]);
          }),
    );
  }
}
