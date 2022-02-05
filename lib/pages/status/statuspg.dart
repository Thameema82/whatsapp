import 'package:flutter/material.dart';
import 'package:testproject/models/models.dart';
import 'package:testproject/pages/status/statustile.dart';

class Status extends StatelessWidget {
  Status({Key? key}) : super(key: key);
  List<Chat> Statuslist = [
    Chat(
        avatar: '',
        name: 'Surya Kiran',
        message: '23 minutes ago',
        updatedAt: '11:00 AM'),
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
            return Statustile(
              dataa: Statuslist[index],
            );
          },
          itemCount: Statuslist.length,
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(
                Icons.edit,
              ),
              backgroundColor: Colors.grey,
              onPressed: () {},
              heroTag: null,
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              child: const Icon(Icons.camera_alt),
              backgroundColor: const Color(0xFF075E54),
              onPressed: () {},
              heroTag: null,
            ),
          ],
        ));
  }
}
