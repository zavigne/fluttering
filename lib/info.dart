import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'home.dart';
//import 'about.dart';

class info extends StatefulWidget{

  createState() => new infoState();
}

class infoState extends State<info>{
  var title = 'WELCOME HOME';
  @override
  Widget build(BuildContext context){
    return Scaffold(
appBar:_header(context) ,
        body: Column(children: <Widget>[
         CachedNetworkImage(
         imageUrl: 'https://thelivingstoneurduchurch.org/wp-content/uploads/2018/07/Contact-Us-Page01.jpg',
          width: MediaQuery.of(context).size.width, ),
       Text("MOBILE MEDIA POINT LTD",style:TextStyle(color:Colors.blue),textAlign:TextAlign.start),
       
       Text("white",style:TextStyle(color:Colors.white),textAlign:TextAlign.start),
       Text("white",style:TextStyle(color:Colors.white),textAlign:TextAlign.start),
       
       Text("All Rights Reserved.This software is a property of Mobile Media Point LTD. The public may claim rights to product usage but not ownership. "),
       
       Text("OUR MAIN SERVICES",style:TextStyle(color:Colors.blue),textAlign:TextAlign.start),
  
       Text("white",style:TextStyle(color:Colors.white),textAlign:TextAlign.start),

       _myText1(Icons.label,"Brand Publishing"),
       _myText1(Icons.label,"Print Media Publishing"),
       _myText1(Icons.label,"Digital Media Publishing"),

       Text("white",style:TextStyle(color:Colors.white),textAlign:TextAlign.start),
       Text("white",style:TextStyle(color:Colors.white),textAlign:TextAlign.start),

     _myText(Icons.language,"www.mobilemediapoint.co.za"),
     _myText(Icons.mail_outline,"info@mobilemediapoint.co.za")

    

        ],),
       persistentFooterButtons: <Widget>[
Row(children:<Widget>[
      Icon(Icons.language),   Text("Mobile Media Point LTD",style:TextStyle(color:Colors.blue),textAlign:TextAlign.start)
     ])
         ,
        new FlatButton(
          child: new Icon(Icons.home),
          onPressed: () {
                Navigator.of(context).pushNamed('/home');
              }
        ),
        new FlatButton(
          child: new Icon(Icons.ev_station),
          onPressed: () {
                Navigator.of(context).pushNamed('/about');
              }
        ),
        new FlatButton(
          child: new Icon(Icons.collections),
          onPressed: () {
                Navigator.of(context).pushNamed('/contact');
              }
        ),
      ], 
      );
        
      
         
        

        
    }


}

Widget _myText(_icon,_text)
{
  return 
   Row(children:<Widget>[
      Icon(_icon),   Text(_text,style:TextStyle(color:Colors.blue),textAlign:TextAlign.start)
     ]);
}

Widget _myText1(_icon,_text)
{
  return 
   Row(children:<Widget>[
      Icon(_icon),   Text(_text,textAlign:TextAlign.start)
     ]);
}

Widget _header(context)
{
  return 
  AppBar(
    actions: <Widget>[
      IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
              Navigator.of(context).pushNamed('/home');
              },
            ),
   GestureDetector(
      child: Text('\n'),
      onTap: () {
        Navigator.of(context).pushNamed('/home');
      }
    ),
     IconButton(
              icon: Icon(Icons.ev_station),
              onPressed: () {
                Navigator.of(context).pushNamed('/about');
              },
            ),
     GestureDetector(
      child: Text('\n'),
      onTap: () {
        Navigator.of(context).pushNamed('/about');
      }
    ),  IconButton(
              icon: Icon(Icons.collections),
              onPressed: () {
                 Navigator.of(context).pushNamed('/contact');
              },
            ),
             GestureDetector(
      child: Text('\n'),
      onTap: () {
        Navigator.of(context).pushNamed('/info');
      }
    ),  IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                 Navigator.of(context).pushNamed('/info');
              },
            )
            
    
  ],
          title:Row(children: <Widget>[
            CachedNetworkImage(
         imageUrl: 'https://www.getmonero.org/press-kit/symbols/monero-symbol-800.png',
          width:50.0,  ),
     //    Image.asset('logo.png'),
          ]));
}