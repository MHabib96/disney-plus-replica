import 'package:disney_plus_replica/bindings.dart';
import 'package:disney_plus_replica/src/modules/base/screens/navigator_base.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureServices();
  await initialiseServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disney Plus',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.transparent,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.blueGrey,
          backgroundColor: Color.fromRGBO(54, 69, 79, 0.3),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const NavigatorBase(),
    );
  }
}
