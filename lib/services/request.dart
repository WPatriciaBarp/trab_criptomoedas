import 'package:http/http.dart' as http;

class Request{
  static Future <String> resReq({required String req}) async{
    final Uri uri = Uri.parse(req);
    final response = await http.get(uri);
    return response.body;
  }
}