import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_portfolio/controller/commodity_controller.dart';

class CommodityTab extends StatefulWidget {
  const CommodityTab({Key? key}) : super(key: key);

  @override
  _CommodityTabState createState() => _CommodityTabState();
}

class _CommodityTabState extends State<CommodityTab> {
  final commodityController = Get.put(CommodityController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
        child: ListView(
          children: [
            GetX<CommodityController>(builder: (controller) {
              if(controller.restData.isNotEmpty) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      color: Color(0xFFEFEFEF),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Commodity',
                                style: GoogleFonts.manrope(fontWeight: FontWeight.w700, fontSize: 16, color: Color(0xFF393E46)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 280,
                            ),
                            child: ListView.builder(
                              shrinkWrap: false,
                              physics: BouncingScrollPhysics(),
                              itemCount: controller.restData[0].data!.datalist![0].list!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 15,),
                                            Text(
                                              controller.restData[0].data!.datalist![0].list![index].name.toString(),
                                              style: GoogleFonts.manrope(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xFF194350)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '₹',
                                                  style: GoogleFonts.manrope(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.lightBlue),
                                                ),
                                                Text(
                                                  controller.restData[0].data!.datalist![0].list![index].cp.toString(),
                                                  style: GoogleFonts.manrope(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.lightBlue),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  controller.restData[0].data!.datalist![0].list![index].chg.toString(),
                                                  style: GoogleFonts.manrope(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 12,
                                                      color: double
                                                          .parse(controller.restData[0].data!.datalist![0].list![index].chg.toString().replaceAll(',', ''))
                                                          .isNegative
                                                          ? Colors.red
                                                          : Colors.green),
                                                ),
                                                Text(
                                                  ' (' + controller.restData[0].data!.datalist![0].list![index].pchg.toString() + '%)',
                                                  style: GoogleFonts.manrope(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 12,
                                                      color:
                                                      double
                                                          .parse(controller.restData[0].data!.datalist![0].list![index].pchg.toString())
                                                          .isNegative
                                                          ? Colors.red
                                                          : Colors.green),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'volume : ',
                                                  style: GoogleFonts.manrope(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.black45),
                                                ),
                                                Text(
                                                  controller.restData[0].data!.datalist![0].list![index].vol.toString(),
                                                  style: GoogleFonts.manrope(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black45),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    index != controller.restData[0].data!.datalist![0].list!.length - 1 ? Divider() : Row(),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(8),
                      color: Color(0xFFEFEFEF),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Currencies',
                                style: GoogleFonts.manrope(fontWeight: FontWeight.w700, fontSize: 16, color: Color(0xFF393E46)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 210,
                            ),
                            child: ListView.builder(
                              shrinkWrap: false,
                              physics: BouncingScrollPhysics(),
                              itemCount: controller.restData[0].data!.datalist![1].list!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 15,),
                                            Text(
                                              controller.restData[0].data!.datalist![1].list![index].name.toString(),
                                              style: GoogleFonts.manrope(fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xFF194350)),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '₹',
                                                  style: GoogleFonts.manrope(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.lightBlue),
                                                ),
                                                Text(
                                                  controller.restData[0].data!.datalist![1].list![index].cp.toString(),
                                                  style: GoogleFonts.manrope(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.lightBlue),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  controller.restData[0].data!.datalist![1].list![index].chg.toString(),
                                                  style: GoogleFonts.manrope(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 12,
                                                      color: double
                                                          .parse(controller.restData[0].data!.datalist![1].list![index].chg.toString().replaceAll(',', ''))
                                                          .isNegative
                                                          ? Colors.red
                                                          : Colors.green),
                                                ),
                                                Text(
                                                  ' (' + controller.restData[0].data!.datalist![1].list![index].pchg.toString() + '%)',
                                                  style: GoogleFonts.manrope(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 12,
                                                      color:
                                                      double
                                                          .parse(controller.restData[0].data!.datalist![0].list![index].pchg.toString())
                                                          .isNegative
                                                          ? Colors.red
                                                          : Colors.green),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    index != controller.restData[0].data!.datalist![1].list!.length - 1 ? Divider() : Row(),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Container(width: 25,height: 25,child: CircularProgressIndicator(strokeWidth: 4.5,color: Colors.amber,)),
                  ],
                );
              }
            },),
          ],
        ),
      ),
    );
  }
}
