import 'package:flutter/material.dart';
import 'package:testproject/models/models.dart';

class Callstile extends StatefulWidget {
  Callstile({Key? key, required this.data2}) : super(key: key);
  Chat data2;
  @override
  _CallstileState createState() => _CallstileState();
}

class _CallstileState extends State<Callstile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          radius: 20,
          child: widget.data2.isGroup == true
              ? const Icon(
                  Icons.group,
                  color: Colors.white,
                  size: 25,
                )
              : const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 25,
                ),
          backgroundColor: Colors.grey,
        ),
        title: Text(widget.data2.name.toString(),
        style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Row(
          children: [
            const Icon(
              Icons.call_made,
              color: Colors.green,
              size: 17,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(widget.data2.message.toString()),
          ],
        ),
        trailing: const Icon(Icons.call, color: Color(0xFF075E54)),
        onTap: () {});
  }
}
