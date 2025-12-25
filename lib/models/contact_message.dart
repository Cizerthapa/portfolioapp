class ContactMessage {
  final String name;
  final String email;
  final String message;
  final DateTime timestamp;

  ContactMessage({
    required this.name,
    required this.email,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'message': message,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory ContactMessage.fromMap(Map<String, dynamic> map) {
    return ContactMessage(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      message: map['message'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] ?? 0),
    );
  }
}
