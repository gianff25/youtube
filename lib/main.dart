import 'package:flutter/material.dart';
import 'package:youtube/layouts/main_layout.dart';
import 'package:youtube/router/router.dart';
import 'package:youtube/service/navigation_service.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube',
      initialRoute: Flurorouter.rootRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      builder: (_, child){
        return MainLayout(child: child!);
      },
    );
  }
}