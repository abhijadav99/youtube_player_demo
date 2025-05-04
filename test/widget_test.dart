import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:youtube_player_demo/main.dart';

void main() {
  testWidgets('Verify app initialization', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const MaterialApp(
      home: PlyrPlayer(),
    ));

    // Verify the app bar title exists
    expect(find.text('YouTube Player'), findsOneWidget);
    
    // Verify the video player container exists
    expect(find.byType(HtmlElementView), findsOneWidget);
    
    // Verify control buttons exist
    expect(find.text('Play'), findsOneWidget);
    expect(find.text('Pause'), findsOneWidget);
    expect(find.text('Mute'), findsOneWidget);
    expect(find.text('Unmute'), findsOneWidget);
  });
}