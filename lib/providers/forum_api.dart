import 'dart:convert';
import 'package:get/get.dart';
import 'package:stock_portfolio/models/forum_model.dart';

class ForumApi extends GetConnect {
  Future<List<ForumModel>> forumData(String searchCode) async {
    List<ForumModel> data = [];
    data.clear();
    var response = await get("https://appfeeds.moneycontrol.com/jsonapi/messages/topic_messages&format=json&tab=1&user_id=$searchCode&token=&start=pageno&topic_id=341");
    // print(response.body);
    if (response.statusCode == 200) {
      if (response.status.isBlank == false) {
        final forumModel = forumModelFromJson(jsonEncode(response.body));
        data.add(forumModel);
      }
    }
    return data;
  }
}