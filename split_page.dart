
import 'package:flutter/services.dart';

class SplitScreenService {
  static const platform = MethodChannel('split_screen_channel');

  static Future<void> startSplitScreen() async {
    try {
      await platform.invokeMethod('startSplitScreen');
    } catch (e) {
      print("Failed to start split screen: $e");
    }
  }
}




