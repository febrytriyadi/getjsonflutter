import 'package:flutter/material.dart';
import 'package:testpraktek/usermodel.dart';
import 'package:testpraktek/userviewmodel.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HalamanUtama(),
      ),
    );
  }
}
class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  List<UserModel> dataUser = new List();
  void getDataUser() {
    UserViewModel().getUsers().then((value) {
          setState(() {
            dataUser = value;
          });
        });
      }
    
      @override
      void initState() {
        // TODO: implement initState
        super.initState();
        getDataUser();
      }
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: dataUser == null ? Center(child: CircularProgressIndicator(),) : ListView.builder(
            itemCount: dataUser.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(dataUser[i].name),
              );
            },
          ),
        );
      }
    }