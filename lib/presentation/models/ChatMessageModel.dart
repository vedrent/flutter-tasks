class ChatMessageModel {
  final String text;
  final String? receiver;

  ChatMessageModel({
    required this.text,
    this.receiver
  });
}