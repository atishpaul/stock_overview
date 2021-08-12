import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_portfolio/controller/search_controller.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final searchControllerr = Get.put(SearchController());
  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Hero(
                tag: 'search',
                child: Material(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Color(0xFFEFEFEF),
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        controller: searchTextController,
                        onChanged: (value) {
                          searchControllerr.searchController.searchFor(searchTextController.text).then((value) {
                            searchControllerr.restDataa.clear();
                            searchControllerr.restDataa.add(value[0]);
                          });
                        },
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            enabled: true,
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
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GetX<SearchController>(
                  builder: (controller) {
                    if(controller.restDataa.value.isNotEmpty) {
                      return ListView.builder(
                        itemCount: controller.restDataa[0].result!.length,
                        itemBuilder: (context, index) {
                          if (controller.restDataa[0].result![index].category == 'Stock') {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: Color(0xFFEFEFEF),
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        controller.restDataa[0].result![index].name.toString(),
                                        style: GoogleFonts.manrope(fontSize: 17),
                                      ),),
                                  ),
                                  controller.restDataa[0].result!.length-1 == index ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(borderRadius: BorderRadius.circular(25),child: Container(width: 50,child: Divider(height: 25,thickness: 4,color: Colors.black54,))),
                                    ],
                                  ):Row(),
                                ],
                              ),
                            );
                          } else {
                            return Row();
                          }
                        },
                      );
                    } else {
                      return Row();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
