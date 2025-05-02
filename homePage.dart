import 'package:compny_project/controller/HomeController.dart';
import 'package:compny_project/pages/SecondPage.dart';
import 'package:compny_project/pages/split_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';



class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Get.put(HomeController());
 // Using GetX Controller
  Future<void> requestSplitScreen() async {
    const platform = MethodChannel('split_screen_channel');
    try {
      await platform.invokeMethod('startSplitScreen');
    } on PlatformException catch (e) {
      Get.snackbar('Error', e.message ?? 'Failed to request split screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Demo App')),
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // First Button - Show Toast
              ElevatedButton(
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "This is a Toast message!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                  );
                },
                child: Text('Show Toast Message'),
              ),

              SizedBox(height: 20),

              // Second Button - Navigate to a new page
              ElevatedButton(
                onPressed: () {
                  // Navigate to the new page
                  Get.toNamed('/second');
                },
                child: Text('Go to New Page'),
              ),

              SizedBox(height: 20),

              // Third Button - Open Half Screen and then navigate to another activity
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  SplitScreenService.startSplitScreen();
                },
                child: Text("Start Split Screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




  class HalfScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Adjust the height as needed
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text('Half Screen Page'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to another activity (Second Page) after half-screen
              Get.to(SecondPage());
            },
            child: Text('Go to Next Activity'),
          ),
        ],
      ),
    );
  }
}