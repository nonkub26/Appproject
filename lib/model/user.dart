class User {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;

  final int balance;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.balance,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        balance: json['balance']);
  }
}
