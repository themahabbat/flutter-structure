import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flt/provider.dart';

import './pages/home.dart';

void main() => runApp(_App());

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
        builder: (context) => AppState(),
        child: MaterialApp(
            // title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.indigo,
            ),
            home: HomePage(title: 'Home', description: 'Hello World!')));
  }
}
