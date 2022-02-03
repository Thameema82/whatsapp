import 'package:flutter/material.dart';
import 'package:testproject/models/models.dart';
import 'package:testproject/pages/chat/chatdetails.dart';

class Chattile extends StatefulWidget {
  Chattile({Key? key, required this.data}) : super(key: key);
  Chat data;

  @override
  _ChattileState createState() => _ChattileState();
}

class _ChattileState extends State<Chattile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Chatdetail(
              userdata: widget.data,
            ),
          )),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: widget.data.avatar == ''
              ? AssetImage(widget.data.isGroup == true
                  ? 'assets/images/groupicon.png'
                  : 'assets/images/icon1.jpg')
              : AssetImage(widget.data.avatar.toString()),
          // child: widget.data.isGroup == true
          //     ? const Icon(
          //         Icons.group,
          //         color: Colors.white,
          //         size: 25,
          //       )
          //     : const Icon(
          //         Icons.person,
          //         color: Colors.white,
          //         size: 25,
          //       ),
          // backgroundColor: Colors.grey,
        ),
        title: Text(
          widget.data.name.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            const Icon(
              Icons.done_all,
              color: Colors.blue,
              size: 17,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(widget.data.message.toString())
          ],
        ),
        trailing: Text(widget.data.updatedAt.toString()),
      ),
    );
  }
}
