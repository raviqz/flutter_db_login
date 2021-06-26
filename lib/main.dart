import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:db_flutter/adminpage.dart';

void main() => runApp(new MyApp());

String username = '';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Koneksi Flutter ke MySQL',
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/adminpage': (BuildContext context) => new AdminPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _proseslogin() async {
    final response = await http
        .post("http://10.0.2.2/login_flutter/proses_login.php", body: {
      "username": user.text,
      "password": pass.text,
    });
    var dataadmin = json.decode(response.body);

    if (dataadmin.length == 1) {
      Navigator.pushReplacementNamed(context, '/adminpage');
      setState(() {
        username = dataadmin[0]['username'];
      });
    } else {
      setState(() {
        msg = "Login Gagal";
      });
    }
    return dataadmin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                "Username",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: user,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Username',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  fillColor: Color(0xfff3f3f4),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Password",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  fillColor: Color(0xfff3f3f4),
                ),
              ),
              RaisedButton(
                child: Text("Login"),
                onPressed: () {
                  _proseslogin();
                },
              ),
              Text(
                msg,
                style: TextStyle(fontSize: 15.0, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
