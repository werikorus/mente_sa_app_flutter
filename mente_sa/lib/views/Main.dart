import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_sa/models/user.dart';
import 'package:mente_sa/provider/users.dart';
import 'package:provider/provider.dart';

import '../views/Form.dart';

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
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;

  TextEditingController _name = TextEditingController();

  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final User user = ModalRoute.of(context).settings.arguments;
    _loadFormData(user);
  }

  Widget build(BuildContext context) {
    return Scaffold(

      body: _isLoading 
      ? Center(child: CircularProgressIndicator())
      :Container(
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
                      return _name;
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
                  onPressed: () async {
                    final isValid = _form.currentState.validate();

                    if (isValid) {
                      _form.currentState.save();
                      setState(() {
                        _isLoading = true;
                      });

                      await Provider.of<Users>(context, listen: false).put(
                        User(
                          id: _formData['id'],
                          name: _formData['name'],
                          email: _formData['email'],
                          avatarUrl: _formData['avatarUrl'],
                        ),
                      );

                      setState(() {
                        _isLoading = false;
                      });
                    }

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
      ),
    );
  }
}
