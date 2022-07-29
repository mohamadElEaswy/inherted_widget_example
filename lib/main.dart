import 'package:flutter/material.dart';

import 'src/controller/state_widgets.dart';
import 'src/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => StateWidget(
        child: Builder(builder: (context) {
          final state = StateInheritedWidget.of(context).state;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Inherited Widget Example',
            theme: ThemeData(
              primarySwatch: state.primarySwatch,
            ),
            home: const HomePage(),
          );
        }),
      );
}
