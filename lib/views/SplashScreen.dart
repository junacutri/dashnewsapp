import 'dart:convert';

import 'package:dashnews/data/ThemeHandler.dart';
import 'package:dashnews/data/controller.dart';
import 'package:dashnews/views/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ControllerSession appController = Get.find();
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    this.loadPosts();
  }

  void loadPosts() async {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    appController.setDarkMode(dark: darkModeOn);
  }

  List<Widget> getPageViews() {
    return [
      Container(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 40,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height * 0.75) * 0.7,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(appController.darkMode.value
                            ? 'assets/img-onb-a-dark.png'
                            : 'assets/img-onb-a.png'))),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height * 0.75) * 0.2,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Curated Dash News',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ThemeHandler.getTextColor(
                                dark: appController.darkMode.value)),
                      ),
                      Text(
                        'Browse the latest coverage on Dash with ease.',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 40,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height * 0.75) * 0.7,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(appController.darkMode.value
                            ? 'assets/img-onb-b-dark.png'
                            : 'assets/img-onb-b.png'))),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height * 0.75) * 0.2,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Search, Share & Bookmark',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ThemeHandler.getTextColor(
                                dark: appController.darkMode.value)),
                      ),
                      Text(
                        'Find, save and share the best Dash articles',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 40,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height * 0.75) * 0.7,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(appController.darkMode.value
                            ? 'assets/img-onb-c-dark.png'
                            : 'assets/img-onb-c.png'))),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height * 0.75) * 0.2,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Learn About Dash',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ThemeHandler.getTextColor(
                                dark: appController.darkMode.value)),
                      ),
                      Text(
                        'Useful learning resources about Dash and how it works.',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ThemeHandler.getBottomBarColor(dark: appController.darkMode.value),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 40,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(appController.darkMode.value
                              ? 'assets/img-onb-bg-dark.png'
                              : 'assets/img-onb-bg.png'))),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: PageView(
                      controller: this.pageController,
                      onPageChanged: (page) {
                        this.setState(() {
                          currentPage = page;
                        });
                      },
                      children: this.getPageViews(),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.off(HomeScreen(
                              currentIndex: 0,
                            ));
                          },
                          child: Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color: ThemeHandler.getOnbButton(
                                  dark: appController.darkMode.value),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 130,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [0, 1, 2]
                                .map((e) => this.currentPage == e
                                    ? Container(
                                        width: 12,
                                        height: 12,
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(0, 141, 228, 1),
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      )
                                    : Container(
                                        width: 12,
                                        height: 12,
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                127, 140, 152, 0.4),
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ))
                                .toList(),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (pageController.page == 2) {
                              Get.off(HomeScreen(
                                currentIndex: 0,
                              ));
                            } else {
                              pageController.nextPage(
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeOut);
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color: ThemeHandler.getOnbButtonB(
                                  dark: appController.darkMode.value),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
