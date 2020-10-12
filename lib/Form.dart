import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Results.dart';

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

class FormPage extends StatefulWidget {
  final String name;

  FormPage({this.name});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String nameProfessional;

// conteudos que deverão ser passados para o banco de dados
// com base nessas respostas deverao mostrar os profissionais
  TextEditingController _pergunta1 = TextEditingController();
  TextEditingController _pergunta2 = TextEditingController();
  TextEditingController _pergunta3 = TextEditingController();
  TextEditingController _pergunta4 = TextEditingController();

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
                Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 1),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 1),
                ),
                Text(
                  'Olá,' + widget.name + '!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 50,
                  ),
                ),
                Text(
                  'Nos conte um pouco sobre você',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.deepPurple, fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 1),
                ),
                SizedBox(
                  height: 30,
                  width: 300,
                  child: TextFormField(
                    controller: _pergunta1,
                    decoration: const InputDecoration(
                      hintText: '1. Em que ano você nasceu?',
                      focusColor: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    validator: (value) {
                      if (value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 1),
                ),
                SizedBox(
                  height: 30,
                  width: 300,
                  child: TextFormField(
                    controller: _pergunta2,
                    decoration: const InputDecoration(
                      hintText: '2. Do que você gosta?',
                      focusColor: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    validator: (value) {
                      if (value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 1),
                ),
                SizedBox(
                  height: 30,
                  width: 300,
                  child: TextFormField(
                    controller: _pergunta3,
                    decoration: const InputDecoration(
                      hintText: '3. Do que você não gosta?',
                      focusColor: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    validator: (value) {
                      if (value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 1),
                ),
                SizedBox(
                  height: 30,
                  width: 300,
                  child: TextFormField(
                    controller: _pergunta4,
                    decoration: const InputDecoration(
                      hintText: '4. Se considera uma pessoa da galera?',
                      focusColor: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    validator: (value) {
                      if (value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 1),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          nameProfessional: nameProfessional,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/button.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
