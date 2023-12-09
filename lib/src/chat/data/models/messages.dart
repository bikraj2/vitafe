class Message {
  Message({required this.message, required this.date, required this.userId});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json['message'] as String,
      date: DateTime.parse(json['date'] as String),
      userId: json['userId'] as String,
    );
  }

  Message.empty()
      : message = '',
        date = DateTime.now(),
        userId = '';

  final String message;
  final DateTime date;
  final String userId;

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'date': date.toIso8601String(),
      'userId': userId,
    };
  }

  Message copyWith({
    String? message,
    DateTime? date,
    String? userId,
  }) {
    return Message(
      message: message ?? this.message,
      date: date ?? this.date,
      userId: userId ?? this.userId,
    );
  }
}
