import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:virtusa/res/strings/AppStrings.dart';
import 'package:virtusa/widgets/DetallesPresidente.dart';
import 'model/Presidente.dart';
import 'package:virtusa/widgets/About.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  Future<List<Presidente>> _getPresidentes() async {
    var presidentsInfo = await http.get("https://presidentesdominicanos.com/api/detalles");
    var jsonPresidentObject = json.decode(presidentsInfo.body);

    List<Presidente> pList = [];

    for(var p in jsonPresidentObject){
      Presidente presidente = Presidente(p["image_url"],
          p["nombre"],
          p["vice"],
          p["nacimiento"],
          p["muerte"],
          p["partido"],
          p["fechaPresidente"],
          p["nombreNacimiento"],
          p["oficioAntes"],
          p["breveDescription"],
          p["ofcionDespues"],
          p["citas"],
          p["biografia"],
          p["hechosJocosos"]);
      pList.add(presidente);
    }

    print(pList.length);
    return pList;

  }
  List data;

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(AppStrings.appName),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => About()));
                },
                child: Icon(
                  Icons.assignment_late_outlined,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: _getPresidentes(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Container(
                child: Center(
                  child: Text("Loading...")
                )
              );
            } else {
              return ListView.builder(
                // separatorBuilder: (context, index) => Divider(
                //   color: Colors.black,
                // ),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/" + snapshot.data[index].image_url + ".jpg"),
                     ),
                    title: Text(snapshot.data[index].nombre,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                    subtitle: Text(snapshot.data[index].fechaPresidente,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red
                    ),),
                    onTap: (){
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => DetallesPresidente(snapshot.data[index])));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }


}