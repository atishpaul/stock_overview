import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_portfolio/controller/landing_controller.dart';
import 'package:stock_portfolio/views/tabs/commodity_view_tab.dart';
import 'package:stock_portfolio/views/tabs/home_view_tab.dart';
import 'package:stock_portfolio/views/tabs/news_view_tab.dart';
import 'package:stock_portfolio/views/tabs/stocks_view_tab.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController pageController = PageController(keepPage: true);
  final pageGetController = Get.put(LandingController());



  @override
  void initState() {
    pageController.addListener(() {
      pageGetController.pageValue.value = pageController.page!;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          HomeView(),
          StocksTab(),
          CommodityTab(),
          NewsTab(),
        ],
      ),
      bottomNavigationBar: Container(
       color: Color(0xFF4F0E0E),
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                pageController.jumpToPage(0);
              },
              child: Container(
                height: 25,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        color: pageGetController.pageValue.value == 0 ? Colors.tealAccent : Color(0xFF4F0E0E),
                        width: 15,
                        height: 4,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text('Indices',style: GoogleFonts.aBeeZee(fontSize: 15,color: Colors.white70),),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                pageController.jumpToPage(1);
              },
              child: Container(
                height: 25,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        color: pageGetController.pageValue.value == 1 ? Colors.tealAccent : Color(0xFF4F0E0E),
                        width: 15,
                        height: 4,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text('Stocks',style: GoogleFonts.aBeeZee(fontSize: 15,color: Colors.white70),),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                pageController.jumpToPage(2);
              },
              child: Container(
                height: 25,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        color: pageGetController.pageValue.value == 2 ? Colors.tealAccent : Color(0xFF4F0E0E),
                        width: 15,
                        height: 4,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text('Commodity',style: GoogleFonts.aBeeZee(fontSize: 15,color: Colors.white70),),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                pageController.jumpToPage(3);
              },
              child: Container(
                height: 25,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        color: pageGetController.pageValue.value == 3 ? Colors.tealAccent : Color(0xFF4F0E0E),
                        width: 15,
                        height: 4,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text('News',style: GoogleFonts.aBeeZee(fontSize: 15,color: Colors.white70),),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
