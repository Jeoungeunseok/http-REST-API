import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> httpGet({required String path}) async {
  String baseUrl = 'https://reqres.in$path';
  try {
    http.Response response = await http.get(Uri.parse(baseUrl), headers: {
      "accept": "application/json",
      "Content-Type": "application/json",
    });
    try {
      Map<String, dynamic> resBody =
          jsonDecode(utf8.decode(response.bodyBytes));
      resBody['statusCode'] = response.statusCode;
      return resBody;
    } catch (e) {
      // response body가 json이 아닌 경우
      return {'statusCode': 490};
    }
  } catch (e) {
    // 서버가 응답하지 않는 경우
    // httpFailureNotice();\
    print("httpGet error: $e");
    return {'statusCode': 503};
  }
}
