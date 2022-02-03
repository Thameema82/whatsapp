import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription>? cameras;

class Camera extends StatefulWidget {
  Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController? _cameraController;
  var cameravalue;
  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameravalue = _cameraController?.initialize();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController!);
              }
              return Center(child: CircularProgressIndicator());
            },
            future: cameravalue,
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.flash_auto,
                            color: Colors.white,
                            size: 28,
                          )),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.panorama_fish_eye,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.flip_camera_android,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'hold for video, tap for photo',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
