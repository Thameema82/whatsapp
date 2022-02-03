import 'package:flutter/material.dart';
import 'package:testproject/models/models.dart';

class Statustile extends StatefulWidget {
  Statustile({Key? key, required this.dataa}) : super(key: key);
  Chat dataa;

  @override
  _StatustileState createState() => _StatustileState();
}

class _StatustileState extends State<Statustile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const CircleAvatar(
          radius: 20,
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
          backgroundColor: Colors.grey,
        ),
        title: Text(widget.dataa.name.toString(),
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(widget.dataa.message.toString()),
        trailing: Text(widget.dataa.updatedAt.toString()),
        onTap: () {});
  }
}
