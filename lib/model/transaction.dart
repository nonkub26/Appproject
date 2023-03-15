// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'dart:convert';

Transaction transactionFromJson(String str) => Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

class Transaction {
    Transaction({
        required this.id,
        required this.operation,
        required this.userId,
        required this.amount,
        required this.reference,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    String id;
    String operation;
    String userId;
    int amount;
    String reference;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["_id"],
        operation: json["operation"],
        userId: json["user_id"],
        amount: json["amount"],
        reference: json["reference"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "operation": operation,
        "user_id": userId,
        "amount": amount,
        "reference": reference,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
