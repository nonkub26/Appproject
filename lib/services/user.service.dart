import 'dart:convert';

import 'package:appproject/model/transaction.dart';
import 'package:appproject/model/user.dart';
import 'package:http/http.dart' as http;

import '../constants/http.constant.dart';

class UserService {
  Future<User> getUser(String id) async {
    print(baseUrl + "user/" + id);
    Uri _uri = Uri.parse(baseUrl + "user/" + id);
    var response = await http.get(_uri, headers: setHeaders());
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> parsedData = json.decode(response.body);
      parsedData = parsedData['data'];
      User user = User(
        userType: parsedData['user_type'].toString(),
        id: parsedData['_id'].toString(),
        name: parsedData['name'].toString(),
        email: parsedData['email'].toString(),
        password: parsedData['password'].toString(),
        phoneNumber: parsedData['phone_number'].toString(),
        balance: parsedData['balance'],
      );
      return user;
    } else {
      throw Exception("No user data");
    }
  }

  Future<List<Transaction>> getTransactionHistory(String id) async {
    Uri _uri = Uri.parse("${baseUrl}user/history/$id");
    var response = await http.get(_uri, headers: setHeaders());
    if (response.statusCode == 200) {
      Map parsedData = json.decode(response.body);

      List<Transaction> transactions = List<Transaction>.from(
        parsedData['data'].map(
          (t) => Transaction.fromJson(t),
        ),
      );

      return transactions;
    } else {
      throw Exception("No user data");
    }
  }

  Future<Transaction> topup(String id, int amount) async {
    Uri _uri = Uri.parse("${baseUrl}user/topup");
    print("${baseUrl}user/topup");

    var topupData = {"id": id, "amount": amount, "location": "online"};

    print(topupData);

    var response = await http.put(
      _uri,
      headers: setHeaders(),
      body: json.encode(topupData),
    );
    print(response.statusCode);
    Map parsedData = json.decode(response.body);
    Transaction t = Transaction.fromJson(parsedData['data']['transaction']);
    print("topup complete, amount = $t.amount");
    return t;
  }

  Future<Transaction> withdraw(String id, int amount) async {
    Uri _uri = Uri.parse("${baseUrl}user/withdraw");
    print("${baseUrl}user/withdraw");

    var withdrawData = {"id": id, "amount": amount, "location": "online"};

    print(withdrawData);

    var response = await http.put(
      _uri,
      headers: setHeaders(),
      body: json.encode(withdrawData),
    );
    print(response.statusCode);
    Map parsedData = json.decode(response.body);
    Transaction t = Transaction.fromJson(parsedData['data']['transaction']);
    print("withdraw complete, amount = $t.amount");
    return t;
  }

  Future<Transaction> buy(String sourceId, String destId, int amount) async {
    Uri _uri = Uri.parse("${baseUrl}user/buy");
    print("${baseUrl}user/buy");

    var buyData = {"source_id": sourceId, "dest_id": destId, "amount": amount, "location": "online"};

    print(buyData);

    var response = await http.put(
      _uri,
      headers: setHeaders(),
      body: json.encode(buyData),
    );
    print(response.statusCode);
    Map parsedData = json.decode(response.body);
    Transaction t = Transaction.fromJson(parsedData['data']['transaction']);
    print("buy complete, amount = $t.amount");
    return t;
  }
}
