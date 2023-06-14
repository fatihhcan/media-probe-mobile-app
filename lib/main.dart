import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:media_probe_mobile_app/views/home/home_view.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/navigation/navigation_routes.dart';
import 'core/providers/data_provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
  );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      home: HomeView(),
    );
  }
}
