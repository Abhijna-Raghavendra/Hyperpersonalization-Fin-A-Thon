class ExpenseData {
  ExpenseData(this.id, this.timestamp, this.category, this.expense, this.user);

  final int id;
  final double expense;
  final String user;
  final String category;
  final String timestamp;
  factory ExpenseData.fromJson(Map<String, dynamic> json) {
    return ExpenseData(
        json['id'] as int,
        json['timestamp'] as String,
        json['category'] as String,
        json['expense'] as double,
        json['user'] as String);
  }
}

class UserData {
  UserData(this.phoneNo, this.name, this.mpin);

  final String phoneNo;
  final String name;
  final int mpin;
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(json['phone_no'] as String, json['name'] as String,
        json['mpin'] as int);
  }
}
