import 'dart:convert';

import 'package:http/http.dart' as http;

class OtpRepositories {
  Future registerOtp({required String phone}) async {
    try {
      //testotp
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse('https://otp.test'));
      request.body = json.encode({"mobile": phone});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        var json = jsonDecode(res);

        return json;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e, stackTrace) {
      print('sms exception : $e');
      print(stackTrace);
    }
  }
}
