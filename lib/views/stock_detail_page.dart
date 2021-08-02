import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_portfolio/charts/line_chart.dart';
import 'package:stock_portfolio/controller/stock_details_controller.dart';
import 'package:tabbar/tabbar.dart';

class StockDetailPage extends StatefulWidget {
  final String? code;

  const StockDetailPage({Key? key, this.code}) : super(key: key);
  @override
  _StockDetailPageState createState() => _StockDetailPageState();
}

class _StockDetailPageState extends State<StockDetailPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final stockDetailController = Get.put(StocksDetailController());
  final controller = PageController();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    stockDetailController.time.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Column(
          children: [
            Container(
                color: Color(0xFF0F044C),
                height: 180,
                child: SafeArea(
                  top: true,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.visibility_rounded,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ITC',
                              style: GoogleFonts.manrope(color: Colors.white70, fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                color: Colors.black26,
                                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                child: Text(
                                  'Cigarettes',
                                  style: GoogleFonts.manrope(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '204.65',
                              style: GoogleFonts.manrope(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                color: Colors.black26,
                                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                child: Row(
                                  children: [
                                    Text(
                                      'Indicator : ',
                                      style: GoogleFonts.manrope(color: Colors.white54, fontSize: 10, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Neutral',
                                      style: GoogleFonts.manrope(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              '204.65',
                              style: GoogleFonts.manrope(color: Colors.lightGreenAccent, fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '(25.5%)',
                              style: GoogleFonts.manrope(color: Colors.lightGreenAccent, fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ConstrainedBox(
            //     constraints: BoxConstraints(
            //       maxHeight: 35
            //     ),
            //     child: ListView(
            //       scrollDirection: Axis.horizontal,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 1.0),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(5),
            //             child: Container(
            //               color: Colors.brown,
            //               child: Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Text('Overview',style: GoogleFonts.manrope(color: Colors.white70),),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 1.0),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(5),
            //             child: Container(
            //               color: Colors.brown,
            //               child: Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Text('Statistics',style: GoogleFonts.manrope(color: Colors.white70),),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 1.0),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(5),
            //             child: Container(
            //               color: Colors.brown,
            //               child: Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Text('Apperance',style: GoogleFonts.manrope(color: Colors.white70),),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 1.0),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(5),
            //             child: Container(
            //               color: Colors.brown,
            //               child: Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Text('In News',style: GoogleFonts.manrope(color: Colors.white70),),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 1.0),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(5),
            //             child: Container(
            //               color: Colors.brown,
            //               child: Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Text('People Responses',style: GoogleFonts.manrope(color: Colors.white70),),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            TabbarHeader(
              controller: controller,
              backgroundColor: Color(0xFF0F044C),
              tabs: [
                Tab(text: 'Overview',),
                Tab(text: "Statistics"),
                Tab(text: "Statistics"),
              ],
            ),
            ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 10),
                  child: Row(
                    children: [
                      Text(
                        'Graph',
                        style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                LineGraph(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 2),
                      child: Row(
                        children: [
                          Text(
                            "What's Happening ?",
                            style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 220, minHeight: 80),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            color: Color(0xFFF1ECC3),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Moving Average (SMA)',
                                        style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Jul 30, 20:00',
                                        style: GoogleFonts.manrope(fontSize: 11, fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        'ITC closes below 30-Day Moving Average of 204.99 today.',
                                        style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
