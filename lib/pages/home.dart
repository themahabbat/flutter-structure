import 'package:flt/pages/about.dart';
import 'package:flt/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.description}) : super(key: key);

  final String title;
  final String description;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  final textFieldStyle = TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Auth Token',
                      hintText: 'User Token'),
                  textAlign: TextAlign.center,
                  style: textFieldStyle,
                  onChanged: (text) => appState.setAuthToken(text),
                ),
              ),
              Text(
                'You have pushed the button this many times: ${appState.authToken}',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
              RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('Set Auth Token'),
                onPressed: () {
                  appState.setAuthToken('fuck');
                },
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.yellow,
                        textColor: Colors.black,
                        padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                        onPressed: () {
                          _incrementCounter();
                        },
                        child: Text(
                          'Increment',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      RaisedButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                        onPressed: _counter > 0
                            ? () {
                                _decrementCounter();
                              }
                            : null,
                        child: Text(
                          'Decrement',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AboutPage()));
                        },
                        child: Text('About'),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Increment',
        child: Icon(Icons.clear),
      ),
    );
  }
}
