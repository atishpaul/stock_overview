import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:stock_portfolio/controller/stock_details_controller.dart';

class PeopleResponsesTab extends StatefulWidget {
  const PeopleResponsesTab({Key? key}) : super(key: key);

  @override
  _PeopleResponsesTabState createState() => _PeopleResponsesTabState();
}

class _PeopleResponsesTabState extends State<PeopleResponsesTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(
        //     children: [
        //       Text('Comments by People',style: GoogleFonts.manrope(fontSize: 18,fontWeight: FontWeight.bold),),
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 200,
        ),
        Center(child: Text('Coming Soon',style: GoogleFonts.manrope(fontSize: 18),)),
      ],
    );
  }
}
