class ExpenseData {
  ExpenseData(this.id, this.timestamp, this.category, this.expense, this.user);

  final int id;
  final double expense;
  final int user;
  final String category;
  final String timestamp;
  factory ExpenseData.fromJson(Map<String, dynamic> json) {
    return ExpenseData(
      json['id'] as int,
      json['timestamp'] as String,
      json['category'] as String,
      json['expense'] as double,
      json['user'] as int
    );
  }
}