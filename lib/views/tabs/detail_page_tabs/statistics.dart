import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_portfolio/controller/stock_details_controller.dart';
import 'package:get/get.dart';

class StatisticsTab extends StatefulWidget {
  final StocksDetailController? statsController;
  const StatisticsTab({Key? key, this.statsController}) : super(key: key);

  @override
  _StatisticsTabState createState() => _StatisticsTabState();
}

class _StatisticsTabState extends State<StatisticsTab> {
  @override
  Widget build(BuildContext context) {
    return GetX<StocksDetailController>(
      builder: (controller) {
      return Expanded(
        child: ListView(
          shrinkWrap: false,
          padding: EdgeInsets.zero,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                  child: Row(
                    children: [
                      Text('Standalone',style: GoogleFonts.manrope(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.indigo),),
                      Text(' | ',style: GoogleFonts.manrope(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black54),),
                      Text('Consolidation',style: GoogleFonts.manrope(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.pink),),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'EPS (TTM)',
                                  style: GoogleFonts.manrope(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 15),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      controller.restData[0].data!.statistics!.epsTtm!.standalone!.toString(),
                                      style:  GoogleFonts.manrope(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 15),
                                    ),
                                    Text(' | '),
                                    Text(
                                      controller.restData[0].data!.statistics!.epsTtm!.consolidated!.toString(),
                                      style:  GoogleFonts.manrope(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'P/C',
                                style: GoogleFonts.manrope(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                              Row(
                                children: [
                                  Text(
                                    controller.restData[0].data!.statistics!.pc!.standalone!.toString(),
                                    style:  GoogleFonts.manrope(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 15),
                                  ),
                                  Text(' | '),
                                  Text(
                                    controller.restData[0].data!.statistics!.pc!.consolidated!.toString(),
                                    style:  GoogleFonts.manrope(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'P/E',
                                style: GoogleFonts.manrope(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                              Row(
                                children: [
                                  Text(
                                    controller.restData[0].data!.statistics!.pe!.standalone!.toString(),
                                    style:  GoogleFonts.manrope(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 15),
                                  ),
                                  Text(' | '),
                                  Text(
                                    controller.restData[0].data!.statistics!.pe!.consolidated!.toString(),
                                    style:  GoogleFonts.manrope(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Price / Book',
                                style: GoogleFonts.manrope(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                              Row(
                                children: [
                                  Text(
                                    controller.restData[0].data!.statistics!.pb!.standalone!.toString(),
                                    style:  GoogleFonts.manrope(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 15),
                                  ),
                                  Text(' | '),
                                  Text(
                                    controller.restData[0].data!.statistics!.pb!.consolidated!.toString(),
                                    style:  GoogleFonts.manrope(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Book Value (RS)',
                                  style: GoogleFonts.manrope(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 15),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      controller.restData[0].data!.statistics!.bv!.standalone!.toString(),
                                      style:  GoogleFonts.manrope(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 15),
                                    ),
                                    Text(' | '),
                                    Text(
                                      controller.restData[0].data!.statistics!.bv!.consolidated!.toString(),
                                      style:  GoogleFonts.manrope(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Deliveries (%)',
                                style: GoogleFonts.manrope(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                              Text(
                                controller.restData[0].data!.statistics!.deliverables!.toString(),
                                style: GoogleFonts.manrope(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Market Cap (CR)',
                                  style: GoogleFonts.manrope(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 15),
                                ),
                                Text(
                                  controller.restData[0].data!.statistics!.mktcap!.toString(),
                                  style:  GoogleFonts.manrope(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Dividend',
                                style: GoogleFonts.manrope(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                              Text(
                                controller.restData[0].data!.statistics!.dividend!.toString(),
                                style:  GoogleFonts.manrope(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dividend Yield',
                                  style: GoogleFonts.manrope(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 15),
                                ),
                                Text(
                                  controller.restData[0].data!.statistics!.divYield!.toString(),
                                  style:  GoogleFonts.manrope(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Face Value (RS)',
                                style: GoogleFonts.manrope(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                              Text(
                                controller.restData[0].data!.statistics!.faceValue!.toString(),
                                style:  GoogleFonts.manrope(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Market Lot',
                                  style: GoogleFonts.manrope(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 15),
                                ),
                                Text(
                                  controller.restData[0].data!.statistics!.marketLot!.toString(),
                                  style:  GoogleFonts.manrope(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Industry P/E',
                                style: GoogleFonts.manrope(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                              Text(
                                controller.restData[0].data!.statistics!.indPe!.toString(),
                                style: GoogleFonts.manrope(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    },);
  }
}
