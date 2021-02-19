import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtusa/model/Presidente.dart';

class DetallesPresidente extends StatelessWidget{
  final Presidente presidente;

  DetallesPresidente(this.presidente);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(presidente.nombre),
        leading: Icon(
          Icons.menu,
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                    Icons.more_vert
                ),
              )
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            children: [
              Container(
                child: Image(
                  image: AssetImage("assets/images/" + presidente.image_url +".jpg"),
                ),
              ),
              SizedBox(),
              Container(),
              Text(presidente.biografia,
                style: TextStyle(
                    fontSize: 16,
                ),
              textAlign: TextAlign.justify,),

            ],
          ),
        )
          //Text(presidente.biografia),
      ),
    );
  }
  
}