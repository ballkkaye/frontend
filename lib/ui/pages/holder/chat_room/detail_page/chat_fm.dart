import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatProvider = NotifierProvider<ChatFM, ChatModel>(() {
  return ChatFM();
});

class ChatFM extends Notifier<ChatModel> {
  @override
  ChatModel build() {
    return ChatModel("");
  }

  void message(String message) {
    state = state.copyWith(
      message: message,
    );
  }
}

class ChatModel {
  final String message;

  ChatModel(
    this.message,
  );

  ChatModel copyWith({
    String? message,
  }) {
    return ChatModel(
      message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'ChatModel{message: $message}';
  }
}
