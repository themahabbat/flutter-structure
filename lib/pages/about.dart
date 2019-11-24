import 'package:flt/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  Widget okButton(BuildContext context, AppState appState) {
    return FlatButton(
        child: Text('OK'),
        onPressed: () {
          appState.setAuthToken('yeah boi!');
          Navigator.pop(context);
        });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        actions: <Widget>[
          FlatButton(
            child: Text('Click Me'),
            textColor: Colors.white,
            onPressed: () {
              AlertDialog alertDialog = AlertDialog(
                title: Text(appState.authToken),
                content: Text("I am content!"),
                actions: <Widget>[okButton(context, appState)],
              );
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alertDialog;
                  });
            },
          )
        ],
      ),
      body: Container(
        child: Text('Hi There'),
      ),
    );
  }
}
