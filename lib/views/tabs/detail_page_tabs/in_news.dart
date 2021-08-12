import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_portfolio/controller/latest_news_controller.dart';
import 'package:stock_portfolio/controller/stock_details_controller.dart';

import '../../web_view_page.dart';

class InNewsTab extends StatefulWidget {
  final String? scripName;
  final String? scripLastValue;
  const InNewsTab({Key? key, this.scripName, this.scripLastValue}) : super(key: key);

  @override
  _InNewsTabState createState() => _InNewsTabState();
}

class _InNewsTabState extends State<InNewsTab> {
  final newsController = Get.put(LatestNewsController());


  @override
  void dispose() {
    newsController.time.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetX<StocksDetailController>(
        builder: (controller) {
          if(controller.newsData[0].list!.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              itemCount: controller.newsData[0].list!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                      depth: 2,
                      lightSource: LightSource.topLeft,
                    ),
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    WebViewPage(
                                      url: controller.newsData[0].list![index].shareUrl,
                                      heroTag: null,
                                      sourceName: widget.scripName.toString() + " (${widget.scripLastValue}) ",
                                      isComingFrmSpecific: true,
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
                                    widget.scripName.toString(),
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
                                    controller.newsData[0].list![index].creationtime.toString(),
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
                                          controller.newsData[0].list![index].headline.toString(),
                                          style: GoogleFonts.manrope(fontSize: 15, color: Colors.black87),
                                        ),
                                      )),
                                  controller.newsData[0].list![index].thumbnail != null ? Image.network(
                                    controller.newsData[0].list![index].thumbnail.toString(),
                                    width: 120,
                                  ) : Container(width: 120,child: Center(child: Text('(No Thumbnail)')),)
                                ],
                              ),
                            ],
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
    );
  }
}
