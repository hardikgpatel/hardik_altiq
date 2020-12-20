import 'package:flutter/material.dart';
import 'package:hardik_atliq/provider/feed_provider.dart';
import 'package:hardik_atliq/utils/router.dart' as Routing;
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<FeedProvider>(
          create: (_) => FeedProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hardik Patel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Routing.Router.generateRoute,
    );
  }
}
