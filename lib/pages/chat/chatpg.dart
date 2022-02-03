import 'package:flutter/material.dart';
import 'package:testproject/models/models.dart';
import 'package:testproject/pages/chat/chattile.dart';

class Chatpage extends StatelessWidget {
  Chatpage({Key? key}) : super(key: key);
  List<Chat> chatlist = [
    Chat(
        avatar: 'assets/images/avatar1.png',
        isGroup: false,
        message: 'hai',
        name: 'sonu',
        updatedAt: '11:00 AM'),
    Chat(
      avatar: 'assets/images/groupavatar.png',
      isGroup: true,
      message: 'hyyy',
      name: 'class13',
      updatedAt: '8:00 PM',
    ),
    Chat(
        avatar: 'assets/images/avatar2.png',
        isGroup: false,
        message: 'haiii',
        name: 'sonaa',
        updatedAt: '10.00 AM'),
    Chat(
      avatar: '',
      isGroup: false,
      message: 'hy',
      name: 'sonali',
      updatedAt: '6:00 PM',
    ),
    Chat(
      avatar: '',
      isGroup: true,
      message: 'hyyy',
      name: 'class12',
      updatedAt: '6:00 PM',
    ),
    Chat(
      avatar: 'assets/images/avatar1.png',
      isGroup: false,
      message: 'hyyy',
      name: 'rinu',
      updatedAt: '9:00 PM',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Chattile(
              data: chatlist[index],
            );
          },
          itemCount: chatlist.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.chat),
          backgroundColor: const Color(0xFF075E54),
        ));
  }
}
