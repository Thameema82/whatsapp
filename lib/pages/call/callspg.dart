import 'package:flutter/material.dart';
import 'package:testproject/models/models.dart';
import 'package:testproject/pages/call/callstile.dart';

class Calls extends StatelessWidget {
  Calls({Key? key}) : super(key: key);
  List<Chat> calllist = [
    Chat(
        avatar: '',
        name: 'sonu',
        message: '23 minutes ago',
        updatedAt: '11:00 AM'),
    Chat(
      avatar: '',
      isGroup: true,
      message: 'january 1',
      name: 'class12',
      updatedAt: '6:00 PM',
    ),
    Chat(
        avatar: '', name: 'ramu', message: 'yesterday ', updatedAt: '11.00 AM'),
    Chat(
        avatar: '', name: 'rajan', message: 'yesterday ', updatedAt: '5.59 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Callstile(
              data2: calllist[index],
            );
          },
          itemCount: calllist.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add_ic_call),
          backgroundColor: Color(0xFF075E54),
        ));
  }
}
