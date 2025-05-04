import 'dart:html';
import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'dart:ui_web' as ui_web;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PlyrPlayer(),
  ));
}

class PlyrPlayer extends StatelessWidget {
  const PlyrPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    const viewId = 'plyr-view';

    // Register platform view
   ui_web.platformViewRegistry.registerViewFactory(viewId, (int viewId) {
  final container = DivElement()
    ..id = 'flutter-container'
    ..style.width = '100%'
    ..style.height = '100%'
    ..style.border = 'none';

  // Delay to allow DOM to be ready
  Future.delayed(const Duration(milliseconds: 100), () {
    js.context.callMethod('createPlyr', ['E3oG313_kps']); // YouTube ID
  });

  return container;
});


    return Scaffold(
      appBar: AppBar(title: const Text('YouTube Player')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.all(16),
              child: const HtmlElementView(
                viewType: viewId,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 12,
              alignment: WrapAlignment.center,
              children: [
                _buildControlButton('Play', 'plyrPlay'),
                _buildControlButton('Pause', 'plyrPause'),
                _buildControlButton('Mute', 'plyrMute'),
                _buildControlButton('Unmute', 'plyrUnmute'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(String text, String jsMethod) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: () => js.context.callMethod(jsMethod),
      child: Text(text),
    );
  }
}