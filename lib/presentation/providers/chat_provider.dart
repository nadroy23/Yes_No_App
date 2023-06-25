import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: "Bienvenido, soy chat Yes No", fromWho: FromWho.hers),
    Message(text: "Recuerda colocar un '?' al final para porder darte respuesta", fromWho: FromWho.hers)
  ];

  Future<void> sendMessage(String message) async {

    if (message.isEmpty) return;

    final newMessage = Message(text: message, fromWho: FromWho.me);
    messageList.add(newMessage);

    print("aqui 1 $message -- ${message.endsWith("?")} -- ${message.endsWith("? ")}");
    if (message.endsWith("?") || message.endsWith("? ")){
      print("aqui 2");
      herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {

    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}
