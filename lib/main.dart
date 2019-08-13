import 'package:flutter/material.dart';
import 'package:flutter_bloc_sample/src/counter/counter_page.dart';
import 'package:flutter_bloc_sample/src/infiniteList/post_page.dart';
import 'package:flutter_bloc_sample/src/loginForm/login_page.dart';
import 'package:flutter_bloc_sample/src/timer/timer_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Sample'),
      ),
      body: Container(),
      drawer: Drawer(
        child: _buildDrawerHomePage(),
      ),
    );
  }

  Widget _buildDrawerHomePage() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Counter'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CounterPage()));
            },
          ),
          ListTile(
            title: Text('Timer'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TickerMyPage()));
            },
          ),
          ListTile(
            title: Text('Infinte List'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListPostPage()));
            },
          ),
          ListTile(
            title: Text('Login Form'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPageMain()));
            },
          )
        ],
      ),
    );
  }
}


