// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_probe_mobile_app/core/providers/data_provider.dart';
import 'package:media_probe_mobile_app/core/services/data_service.dart';

import 'package:media_probe_mobile_app/main.dart';
import 'package:provider/provider.dart';

void main() async{
   Services services = Services();
   await dotenv.load(fileName: ".env");
   await services.getData();
    
  testWidgets('read more button', (WidgetTester tester) async {

    final readMoreButton = find.byKey(const ValueKey("readMore"));
    Provider.debugCheckInvalidValueType = null;

    await tester.pumpWidget(
      Provider<DataProvider>.value(
        value: DataProvider(),
        child: MyApp(),
      ),
    );

    await tester.enterText(readMoreButton, "Detail page next");
    await tester.tap(readMoreButton);
    await tester.pump(const Duration(seconds: 2));

    expect(find.text("Detail page next"), findsOneWidget);
  });
}
