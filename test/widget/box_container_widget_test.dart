import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_reminder_app/components/box_container_widget.dart';

void main() {
  testWidgets('Box Container test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BoxContainerWidget(
            onSelect: null,
            childWidget: Row(
              children: [
                const Text("Test Data1"),
                const Text("Test Data2"),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                )
              ],
            )),
      ),
    ));
    await tester.pump(const Duration(seconds: 5));

    expect(find.text("Test Data1"), findsOneWidget);
    expect(find.text("Test Data2"), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
