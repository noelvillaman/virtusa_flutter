import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:virtusa/res/strings/AppStrings.dart';
import 'package:virtusa/model/Presidente.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class About extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName),
      ),
      body: SafeArea(
        child: Container(
        alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                new Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: new AssetImage('assets/images/escudo_dominicano.png')
                        )
                    )),
                SizedBox(
                  height: 8,
                ),
                Text(AppStrings.appName,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.justify,),
                SizedBox(
                  height: 8,
                ),
                Text(AppStrings.email,
                style: TextStyle(
                  fontSize: 12,
                ),),
                SizedBox(
                  height: 8,
                ),
                Text(AppStrings.webpage,
                style: TextStyle(
                  fontSize: 12,
                ),),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                    Share.share('Me gustaría compartir mi aplicación contigo\n https://play.google.com/store/apps/details?id=com.software.noelvillaman.lospresidentesdominicanos&hl=en_AU');

                  },
                  child: Text(AppStrings.comparte.toUpperCase()),
                  //style: ,
                )

              ],
            ),
          )
        //Text(presidente.biografia),
      ),
      ),
    );
  }
}