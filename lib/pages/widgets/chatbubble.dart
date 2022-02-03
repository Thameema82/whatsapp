import 'package:flutter/material.dart';
import 'package:testproject/models/model2.dart';

class Chatbubble extends StatelessWidget {
  Chatbubble({Key? key, required this.messagedata}) : super(key: key);
  ChatMessage messagedata;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: messagedata.isSend == true
          ? Alignment.bottomRight
          : Alignment.topLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 150,
        ),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          color: messagedata.isSend == true
              ? Colors.lightGreen[200]
              : Colors.white,
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 30, top: 10, bottom: 20),
                  child: Text(messagedata.message.toString())),
              Positioned(
                  bottom: 4,
                  right: 2,
                  child: Row(children: [
                    Text(
                      messagedata.sendAt.toString(),
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    (messagedata.isSend == true)
                        ? Icon(
                            Icons.done_all,
                            color: messagedata.isReaded == true
                                ? Colors.blue
                                : Colors.grey,
                            size: 15,
                          )
                        : Text('.'),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
