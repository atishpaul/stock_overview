import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_portfolio/controller/latest_news_controller.dart';
import 'package:get/get.dart';

import '../web_view_page.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({Key? key}) : super(key: key);

  @override
  _NewsTabState createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  final newsController = Get.put(LatestNewsController());


  @override
  void dispose() {
    newsController.time.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Column(
        children: [
          Expanded(
            child: GetX<LatestNewsController>(
              builder: (controller) {
                if(controller.latestNewsModel.value.isNotEmpty) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                    itemCount: controller.latestNewsModel[0].data!.datalist!.length,
                    itemBuilder: (context, index) {
                      print(controller.latestNewsModel[0].data!.datalist!.length);
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        child: Neumorphic(
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                            depth: 2,
                            lightSource: LightSource.topLeft,
                          ),
                          child: Hero(
                            tag: '$index',
                            child: Material(
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            WebViewPage(
                                              url: controller.latestNewsModel[0].data!.datalist![index].shareUrl,
                                              heroTag: index.toString(),
                                              sourceName: controller.latestNewsModel[0].data!.datalist![index].source,
                                              isComingFrmSpecific: false,
                                            ),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            controller.latestNewsModel[0].data!.datalist![index].source.toString(),
                                            style: GoogleFonts.manrope(fontSize: 12, color: Colors.black87),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '•',
                                            style: GoogleFonts.manrope(fontSize: 12, color: Colors.black54),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            controller.latestNewsModel[0].data!.datalist![index].dispDate.toString(),
                                            style: GoogleFonts.manrope(fontSize: 12, color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 8.0),
                                                child: Text(
                                                  controller.latestNewsModel[0].data!.datalist![index].heading.toString(),
                                                  style: GoogleFonts.manrope(fontSize: 15, color: Colors.black87),
                                                ),
                                              )),
                                          Image.network(
                                            controller.latestNewsModel[0].data!.datalist![index].img.toString(),
                                            width: 120,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30,width: 30,child: CircularProgressIndicator(backgroundColor: Color(0xFF50CB93),strokeWidth: 2.5,)),
                    ],
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0,vertical: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 32),
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(color: Color(0xFF50CB93),child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical:5),
                        child: Text('TOP NEWS',style: GoogleFonts.manrope(fontSize: 12,color: Colors.white),),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(color: Color(0xFF50CB93),child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical:5),
                        child: Text('MARKET',style: GoogleFonts.manrope(fontSize: 12,color: Colors.white),),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(color:Color(0xFF50CB93),child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical:5),
                        child: Text('STOCKS',style: GoogleFonts.manrope(fontSize: 12,color: Colors.white),),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(color:Color(0xFF50CB93),child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical:5),
                        child: Text('PERSONAL FINANCE',style: GoogleFonts.manrope(fontSize: 12,color: Colors.white),),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(color:Color(0xFF50CB93),child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical:5),
                        child: Text('PERSONAL FINANCE',style: GoogleFonts.manrope(fontSize: 12,color: Colors.white),),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(color:Color(0xFF50CB93),child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical:5),
                        child: Text('OPINION',style: GoogleFonts.manrope(fontSize: 12,color: Colors.white),),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(color:Color(0xFF50CB93),child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical:5),
                        child: Text('PODCAST',style: GoogleFonts.manrope(fontSize: 12,color: Colors.white),),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(color:Color(0xFF50CB93),child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical:5),
                        child: Text('BUSINESS',style: GoogleFonts.manrope(fontSize: 12,color: Colors.white),),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(color:Color(0xFF50CB93),child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical:5),
                        child: Text('RESEARCH',style: GoogleFonts.manrope(fontSize: 12,color: Colors.white),),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
