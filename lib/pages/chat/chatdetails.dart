import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testproject/models/model2.dart';
import 'package:testproject/models/models.dart';
import 'package:testproject/pages/widgets/chatbubble.dart';

class Chatdetail extends StatefulWidget {
  Chatdetail({Key? key, required this.userdata}) : super(key: key);
  Chat userdata;

  @override
  State<Chatdetail> createState() => _ChatdetailState();
}

class _ChatdetailState extends State<Chatdetail> {
  TextEditingController messagecontroller = TextEditingController();
  bool showsend = false;
  bool showemoji = false;
  FocusNode focus_node = FocusNode();
  List<ChatMessage> msglist = [
    ChatMessage(
        isReaded: true,
        isSend: true,
        message: 'what' 's going on?',
        sendAt: '9.45 AM'),
    ChatMessage(
        isReaded: true,
        isSend: true,
        message: 'Hey there?',
        sendAt: '10.45 AM'),
    ChatMessage(
        isReaded: false,
        isSend: false,
        message: 'Hello there?',
        sendAt: '10.45 AM'),
    ChatMessage(
        isReaded: false,
        isSend: false,
        message: 'how do you do',
        sendAt: '12.40 PM'),
    ChatMessage(
        isReaded: true, isSend: true, message: 'hellooo', sendAt: '12.40 PM'),
    ChatMessage(
        isReaded: false,
        isSend: false,
        message:
            'Hi, what were you up to, i thought you were sick, how have you been?  ',
        sendAt: '12.46 PM'),
    ChatMessage(
        isReaded: false,
        isSend: true,
        message: 'how are you',
        sendAt: '12.48 PM'),
  ];

  @override
  void initState() {
    super.initState();
    focus_node.addListener(() {
      if (focus_node.hasFocus) {
        print('if');
        setState(() {
          showemoji = false;
        });
      } else {
        print('else');
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        leadingWidth: 80,
        titleSpacing: 5,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            children: [
              GestureDetector(
                child: const Icon(Icons.arrow_back),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 5,
              ),
              CircleAvatar(
                backgroundImage: widget.userdata.avatar == ''
                    ? AssetImage(widget.userdata.isGroup == true
                        ? 'assets/images/groupicon.png'
                        : 'assets/images/icon1.jpg')
                    : AssetImage(widget.userdata.avatar.toString()),
                // child: widget.userdata.isGroup == true
                //     ? const Icon(  
                //         Icons.group,
                //         color: Colors.white,
                //       )
                //     : const Icon(Icons.person, color: Colors.white),
                // backgroundColor: Colors.grey,
              )
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.userdata.name.toString()),
            Text(
              widget.userdata.updatedAt.toString(),
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        actions: [
          const Icon(Icons.video_call_rounded),
          const SizedBox(
            width: 8,
          ),
          const Icon(Icons.call),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    child: widget.userdata.isGroup == true
                        ? const Text('Group info')
                        : const Text('View contact')),
                PopupMenuItem(
                    child: widget.userdata.isGroup == true
                        ? const Text('Group media')
                        : const Text('Media,links,and docs')),
                const PopupMenuItem(child: Text('Search')),
                const PopupMenuItem(child: Text('Mute notifications')),
                const PopupMenuItem(child: Text('Wallpaper')),
                const PopupMenuItem(child: Text('More'))
              ];
            },
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/backimg.jpeg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            ListView.builder(
                itemBuilder: (context, index) {
                  return Chatbubble(messagedata: msglist[index]);
                },
                itemCount: msglist.length),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            child: TextField(
                              focusNode: focus_node,
                              controller: messagecontroller,
                              onChanged: (value) {
                                if (value.length > 0) {
                                  setState(() {
                                    showsend = true;
                                  });
                                } else {
                                  setState(() {
                                    showsend = false;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: 'message',
                                  prefixIcon: IconButton(
                                    onPressed: () {
                                      focus_node.unfocus();
                                      setState(() {
                                        showemoji = !showemoji;
                                      });
                                    },
                                    icon: showemoji == true
                                        ? Icon(Icons.emoji_emotions_outlined)
                                        : Icon(Icons.keyboard),
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.attach_file),
                                        onPressed: () {
                                          showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (builder) => menu(),
                                          );
                                        },
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.camera_alt))
                                    ],
                                  )),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xFF075E54),
                          child: showsend == true
                              ? Icon(Icons.send)
                              : Icon(Icons.mic),
                        ),
                      )
                    ],
                  ),
                  showemoji == true ? selectEmoji() : Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget selectEmoji() {
    return EmojiPicker(onEmojiSelected: (emoji, category) {
      //messagecontroller.text = emoji.emoji;
      print(category);
    });
  }

  Widget menu() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Iconwidget(Icon(Icons.insert_drive_file), Colors.indigo,
                      'Document', () {}),
                  Iconwidget(
                      Icon(Icons.camera_alt), Colors.pink, 'Camera', () {}),
                  Iconwidget(Icon(Icons.insert_photo), Colors.purple, 'Gallery',
                      () {}),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Iconwidget(
                      Icon(Icons.headset), Colors.orange, 'Audio', () {}),
                  Iconwidget(Icon(Icons.location_pin), Colors.green, 'Location',
                      () {}),
                  Iconwidget(
                      Icon(Icons.contact_phone), Colors.blue, 'Contact', () {})
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Iconwidget(Icon icon, Color color, String text, Function fun) {
    return GestureDetector(
      onTap: () {
        fun();
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: icon,
          ),
          Text(text)
        ],
      ),
    );
  }
}
