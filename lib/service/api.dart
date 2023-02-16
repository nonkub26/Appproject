import 'package:http/http.dart' as http;

class API {
  String _baseUrl = "http://localhost:4000";

  _setHeader() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  getCurrentUser(id) async {
    String reqUrl = _baseUrl + "/user/" + id;
    print(reqUrl);
    return await http.get(
      Uri.parse(reqUrl),
      headers: _setHeader(),
    );
  }

  login(data) async {
    String reqUrl = _baseUrl + "/user/login";
    return await http.post(
      Uri.parse(reqUrl),
      headers: _setHeader(),
      body: data,
    );
  }
}
