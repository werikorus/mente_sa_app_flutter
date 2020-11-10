import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}

class ResultsPage extends StatefulWidget {
  final String nameProfessional;

  ResultsPage({this.nameProfessional});

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              alignment: Alignment.center,
              fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 43, bottom: 1),
                ),
                ListTile(
                  leading: Icon(Icons.menu),
                  trailing: Icon(Icons.reply_all),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 80, bottom: 1)),
                Text(
                  'Resultado da busca',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 35,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 30, bottom: 1)),
                SizedBox(
                  width: 350,
                  height: 115,
                  child: RaisedButton(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Marcos Henrique',
                          style:
                              TextStyle(fontSize: 40, color: Colors.deepPurple),
                        ),
                        Text(
                          'Psicólogo',
                          style:
                              TextStyle(fontSize: 15, color: Colors.deepPurple),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    onPressed: null,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10, bottom: 1)),
                SizedBox(
                  width: 350,
                  height: 115,
                  child: RaisedButton(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Joana Marques',
                          style:
                              TextStyle(fontSize: 40, color: Colors.deepPurple),
                        ),
                        Text(
                          'Psicóloga',
                          style:
                              TextStyle(fontSize: 15, color: Colors.deepPurple),
                        ),
                      ],
                    ),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    onPressed: null,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10, bottom: 1)),
                SizedBox(
                  width: 350,
                  height: 115,
                  child: RaisedButton(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Marta Maria',
                          style:
                              TextStyle(fontSize: 40, color: Colors.deepPurple),
                        ),
                        Text(
                          'Psicóloga',
                          style:
                              TextStyle(fontSize: 15, color: Colors.deepPurple),
                        ),
                      ],
                    ),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    onPressed: null,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
