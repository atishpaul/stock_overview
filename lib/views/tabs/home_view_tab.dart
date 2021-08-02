import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:stock_portfolio/controller/global_indices_controller.dart';
import 'package:stock_portfolio/controller/indian_indices_controller.dart';
import 'package:stock_portfolio/views/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final indianIndices = Get.put(HomeController());
  final globalIndices = Get.put(GlobalIndicesController());

  @override
  void dispose() {
    indianIndices.time.cancel();
    globalIndices.time.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text(
          'My Portfolio',
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: [
            Hero(
              tag: 'search',
              child: Material(
                child: GestureDetector(
                  onTap: () {
                    // Get.to(SearchView());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchView(),
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Color(0xFFF9F9F9),
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            enabled: false,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Search for stocks"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GetX<HomeController>(builder: (controller) {
              if(controller.restData.isNotEmpty) {
                return Container(
                  padding: EdgeInsets.all(8),
                  color: Color(0xFFF9F9F9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Indian Indices',
                            style: GoogleFonts.manrope(fontWeight: FontWeight.w700, fontSize: 16, color: Color(0xFF393E46)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 200,
                        ),
                        child: ListView.builder(
                          shrinkWrap: false,
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.restData[0].list!.indices!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(controller.restData[0].list!.indices![index].flag.toString()),
                                        SizedBox(width: 15,),
                                        Text(
                                          controller.restData[0].list!.indices![index].stkexchg.toString(),
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
                                              controller.restData[0].list!.indices![index].lastprice.toString(),
                                              style: GoogleFonts.manrope(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.lightBlue),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              controller.restData[0].list!.indices![index].change.toString(),
                                              style: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color: double
                                                      .parse(controller.restData[0].list!.indices![index].change.toString())
                                                      .isNegative
                                                      ? Colors.red
                                                      : Colors.green),
                                            ),
                                            Text(
                                              ' (' + controller.restData[0].list!.indices![index].percentchange.toString() + '%)',
                                              style: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color:
                                                  double
                                                      .parse(controller.restData[0].list!.indices![index].percentchange.toString())
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
                                index != controller.restData[0].list!.indices!.length - 1 ? Divider() : Row(),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
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
            SizedBox(
              height: 15,
            ),
            GetX<GlobalIndicesController>(builder: (controller) {
              if(controller.restData.isNotEmpty) {
                return Container(
                  padding: EdgeInsets.all(8),
                  color: Color(0xFFF9F9F9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Global Indices',
                            style: GoogleFonts.manrope(fontWeight: FontWeight.w700, fontSize: 16, color: Color(0xFF393E46)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 200,
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
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.network(controller.restData[0].data!.datalist![1].list![index].flag.toString()),
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
                                                      .parse(controller.restData[0].data!.datalist![1].list![index].chg.toString())
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
                                                      .parse(controller.restData[0].data!.datalist![1].list![index].pchg.toString())
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
