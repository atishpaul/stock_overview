import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_portfolio/controller/stocks_controller.dart';

import '../stock_detail_page.dart';

class StocksTab extends StatefulWidget {
  const StocksTab({Key? key}) : super(key: key);

  @override
  _StocksTabState createState() => _StocksTabState();
}

class _StocksTabState extends State<StocksTab> {
  final stockController = Get.put(StocksController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Highlighted Stocks',
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 18
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GetX<StocksController>(
                builder: (controller) {
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.restData[0].data!.datalist!.length,
                  itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(controller.restData[0].data!.datalist![index].heading.toString(),style: GoogleFonts.manrope(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      SizedBox(height: 5,),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 150,
                        ),
                        child: ListView.builder(
                          itemCount: controller.restData[0].data!.datalist![index].list!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index1) {
                            return Hero(
                              tag: controller.restData[0].data!.datalist![index].list![index1].id.toString() + index1.toString(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    color: Color(0xFFF9F9F9),
                                    child: Material(
                                      color: Colors.white,
                                      child: InkWell(
                                        onTap: () {
                                          stockController.time.cancel();
                                          detailedCode = controller.restData[0].data!.datalist![index].list![index1].id.toString();
                                          Get.to(() => StockDetailPage(code: controller.restData[0].data!.datalist![index].list![index1].id.toString(),heroGen: controller.restData[0].data!.datalist![index].list![index1].id.toString() + index1.toString(),));
                                        },
                                        child: Ink(
                                          color: Color(0xFFFAF1E6),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                                            width: 170,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(controller.restData[0].data!.datalist![index].list![index1].name.toString(),style: GoogleFonts.manrope(fontWeight: FontWeight.bold,color: Color(0xFF512D6D),fontSize: 16.5),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                                  ],
                                                ),
                                                SizedBox(height: 15,),
                                                Row(
                                                  children: [
                                                    Text('₹'+controller.restData[0].data!.datalist![index].list![index1].cp.toString(),style: GoogleFonts.manrope(fontWeight: FontWeight.bold,color: Color(0xFF185ADB),fontSize: 20),),
                                                  ],
                                                ),
                                                SizedBox(height: 1,),
                                                Row(
                                                  children: [
                                                    Text(controller.restData[0].data!.datalist![index].list![index1].chg.toString(),style: GoogleFonts.manrope(fontWeight: FontWeight.bold,color: double.parse(controller.restData[0].data!.datalist![index].list![index1].chg.toString().replaceAll(',', '')).isNegative ? Colors.red:Colors.green,fontSize: 15.5),),
                                                    Text(' ('+controller.restData[0].data!.datalist![index].list![index1].pchg.toString()+')',style: GoogleFonts.manrope(fontWeight: FontWeight.bold,color: double.parse(controller.restData[0].data!.datalist![index].list![index1].chg.toString().replaceAll(',', '')).isNegative ? Colors.red:Colors.green,fontSize: 15.5),),
                                                  ],
                                                ),
                                                SizedBox(height: 1,),
                                                Row(
                                                  children: [
                                                    Text('Volume : '+controller.restData[0].data!.datalist![index].list![index1].vol.toString(),style: GoogleFonts.manrope(fontWeight: FontWeight.w700,color: Color(0xFF54436B),fontSize: 14),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },),
                      )
                    ],
                  );
                },);
              },),
            ),
          ],
        ),
      ),
    );
  }
}
