import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'home.dart';
//import 'mypage.dart';
import 'contact.dart';

class viewPage2 extends StatefulWidget{
  viewPage2({this.data});
  Data2 data;
  
  createState() => new viewPage2State();
}

class viewPage2State extends State<viewPage2>{
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
            Image.asset('logo.png'),
        //     CachedNetworkImage(
        //  imageUrl: 'https://www.getmonero.org/press-kit/symbols/monero-symbol-800.png',
        //   width:50.0,  ),
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
         
        _text(context,widget.data.name,Icons.account_circle),
        _text(context,_date(widget.data.day,widget.data.month,widget.data.year),Icons.assessment),
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

String _date(day,month,year)
{
 
var now = new DateTime.now();
  if(day==null)
  {
    day=now.day;
  }
   if(month==null)
  {
    month=now.month;
  }
   if(year==null)
  {
    year=now.year;
  }

  return "$day / $month / $year";
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
