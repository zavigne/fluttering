import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'home.dart';
//import 'mypage.dart';
import 'about.dart';

class viewPage3 extends StatefulWidget{
  viewPage3({this.data});
  Data3 data;
  
  createState() => new viewPage3State();
}

class viewPage3State extends State<viewPage3>{

  var title = 'WELCOME HOME';
  @override
  Widget build(BuildContext context){
    return Scaffold(
appBar: AppBar(
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
      child:Text('\n'),
      onTap: () {
        Navigator.of(context).pushNamed('/contact');
      }
    )
  ],
          title:Row(children: <Widget>[
            CachedNetworkImage(
         imageUrl: 'https://www.getmonero.org/press-kit/symbols/monero-symbol-800.png',
          width:50.0,  ),
        Text("")
          ])),
        body: Column(children: <Widget>[
        Container(
         decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(0.0),
            color: Colors.blueGrey,
            ) ,
          width: MediaQuery.of(context).size.width,
          child: CachedNetworkImage(
          imageUrl: widget.data.url, fit:BoxFit.scaleDown,
         // height:215.0,
          //width:200.0
          )
         ),
         Container(
            decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(0.0),
            color: Colors.blue,
            ) ,
         // width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child:Row(
            children: <Widget>[
              Icon(Icons.account_circle),
               Text(widget.data.name, style:TextStyle(color:Colors.white),textAlign:TextAlign.center),
       
            ],
          ) 

        ),
        _text(context, widget.data.candidate,Icons.assessment),
        _text(context, widget.data.value,Icons.add_shopping_cart),     
        Text(widget.data.description) 
        ],)
        ,
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
        
      
         
        

        
    );}


}


Widget _text(context,_text,_icon)
{
  return 
    Container( 
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(0.0),
            color: Colors.blue,
            ) ,
      child:
       Row(
           children: <Widget>[ 
           Icon(_icon),   
           Flexible(child: Text(_text, style:TextStyle(color:Colors.white))),
          ]
         )
     );
}
