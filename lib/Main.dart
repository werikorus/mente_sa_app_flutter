import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mente Sã',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
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
                  padding: EdgeInsets.only(top: 120, bottom: 1),
                ),
                Text(
                  'Mente Sã',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 50,
                  ),
                ),
                Text(
                  'Sua plataforma de saúde mental',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.deepPurple, fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 1),
                ),
                SizedBox(height: 20),
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 85, bottom: 1),
                ),
                SizedBox(
                  height: 30,
                  width: 300,
                  child: TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(
                      hintText: 'Nome ou pseudônimo',
                      focusColor: Colors.white,
                      suffixIcon: Icon(Icons.person),
                      contentPadding: EdgeInsets.all(10),
                    ),
                    cursorColor: Colors.white,
                    validator: (_name) {
                      if (_name.isEmpty) {
                        return 'Nos fale seu nome...';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 70),
                FloatingActionButton(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/button.png'),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormPage(
                          // essa informação aqui tem que passar para o banco
                          name: _name.text,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
