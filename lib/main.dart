import 'package:camera/camera.dart'; 
import 'package:flutter/material.dart';
import 'package:testproject/pages/call/callspg.dart';
import 'package:testproject/pages/camera.dart';
import 'package:testproject/pages/chat/chatpg.dart';
import 'package:testproject/pages/status/statuspg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const Whatsapp()); // the class
}

class Whatsapp extends StatelessWidget {
  const Whatsapp({Key? key}) : super(key: key); //constructor

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    ); //material app is design oriented
  }
}

class Homescreen extends StatefulWidget {
  //homescreen is a widget
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController tabControll;
  @override
  void initState() {
    super.initState();
    tabControll = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'WhatsApp',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          backgroundColor: const Color(0xFF075E54),
          actions: [
            const Icon(Icons.search),
            const SizedBox(
              width: 15,
            ),
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: const Text('New group '),
                    value: 1,
                    onTap: () {
                      // ignore: avoid_print
                      print('hi');
                    },
                  ),
                  const PopupMenuItem(
                    child: Text('New broadcast'),
                    value: 2,
                  ),
                  const PopupMenuItem(
                    child: Text('Linked devices'),
                    value: 3,
                  ),
                  const PopupMenuItem(
                    child: Text('Starred messages'),
                    value: 4,
                  ),
                  const PopupMenuItem(
                    child: Text('Payment'),
                    value: 5,
                  ),
                  const PopupMenuItem(child: Text('Settings'), value: 6),
                ];
              },
              onSelected: (value) {
                print(value);
              },
            ),
            // IconButton(
            //     onPressed: () {
            //       print("hi");
            //     },
            //     icon: Icon(Icons.more_vert)),
            const SizedBox(
              width: 10,
            )
          ],
          bottom: TabBar(
            tabs: const [
              Icon(Icons.camera_alt),
              Text('CHATS'),
              Text('STATUS'),
              Text('CALLS'),
            ],
            controller: tabControll,
          ),
        ),
        body: TabBarView(
          children: [
            Camera(),
            Chatpage(),
            Status(),
            Calls(),
          ],
          controller: tabControll,
        ),
      ),
    );
  }
}
