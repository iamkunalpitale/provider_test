import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/screens/user_screen.dart';

import 'models/cart.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => UserScreen(),
        },
      ),
    );
  }
}

