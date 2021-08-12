import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:stock_portfolio/controller/stock_details_controller.dart';

class SwotTab extends StatefulWidget {
  const SwotTab({Key? key}) : super(key: key);

  @override
  _SwotTabState createState() => _SwotTabState();
}

class _SwotTabState extends State<SwotTab> {
  @override
  Widget build(BuildContext context) {
    return GetX<StocksDetailController>(
      builder: (controller) {
      return Expanded(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Strengths',style: GoogleFonts.manrope(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text(controller.restData[0].data!.swotdata!.strengths!.title!.toString() != ''? controller.restData[0].data!.swotdata!.strengths!.title!.toString() : '(No data found)',style: GoogleFonts.manrope(fontSize: 15,color: Colors.black87,fontWeight: FontWeight.w600),)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Opportunities',style: GoogleFonts.manrope(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text(controller.restData[0].data!.swotdata!.opportunities!.title!.toString() != ''? controller.restData[0].data!.swotdata!.opportunities!.title!.toString(): '(No data found)',style: GoogleFonts.manrope(fontSize: 15,color: Colors.black87,fontWeight: FontWeight.w600),)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Threats',style: GoogleFonts.manrope(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text(controller.restData[0].data!.swotdata!.threats!.title!.toString() != '' ? controller.restData[0].data!.swotdata!.threats!.title!.toString() : '(No data found)',style: GoogleFonts.manrope(fontSize: 15,color: Colors.black87,fontWeight: FontWeight.w600),)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Weaknesses',style: GoogleFonts.manrope(fontSize: 18,color: Colors.black54,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text(controller.restData[0].data!.swotdata!.weaknesses!.title!.toString() != '' ? controller.restData[0].data!.swotdata!.weaknesses!.title!.toString(): '(No data found)',style: GoogleFonts.manrope(fontSize: 15,color: Colors.black87,fontWeight: FontWeight.w600),)),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset('assets/swot_icon.png',width: 320,height: 320,alignment: Alignment.center,)
          ],
        ),
      );
    },);
  }
}
