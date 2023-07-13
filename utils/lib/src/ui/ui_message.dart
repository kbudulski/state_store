class UIMessage {
  UIMessage({
    required this.name,
    required this.text,
    required this.date,
    required this.sentByCurrentUser,
  });

  final String name;
  final String text;
  final DateTime date;
  final bool sentByCurrentUser;
}
