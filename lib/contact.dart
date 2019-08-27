import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttering/viewPage.dart';
import 'package:fluttering/viewPage1.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'home.dart';
import 'viewPage2.dart';
import 'dart:convert';

class Data2{
  String name;
  String url;
  String description;
  String value;
  String day;
  String month;
  String year;


  Data2({this.name,this.url,this.description,this.value,this.day,this.month,this.year});
}

class contact extends StatefulWidget{
  createState() => new contactState();
}

const baseUrl = "https://zavigne.000webhostapp.com/db/0public.php";
//https://zavigne.000webhostapp.com/db/0public.php
//https://zavigne.000webhostapp.com/db/0companies.php
//https://zavigne.000webhostapp.com/db/0services.php

class API {
  static Future getUsers() {
    var url = baseUrl;
    return http.get(url);
  }
}




class User {
  String name;
  String url;
  String description;
  String value;
  String day;
  String month;
  String year;

  User(String name, String url,String year,String description,String value,String day,String month) {
    this.name = name;
    this.url = url;
    this.description = description;
    this.value = value;
    this.day = day;
    this.month = month;
    this.year = year;
  }

  User.fromJson(Map json)
      : name = json['name'],
        url = json['url'],
        description = json['description'],
        value = json['value'],
        day = json['day'],
        month = json['month'],
        year = json['year'];

  Map toJson() {
    return {'name': name, 'url': url,'year':year,'description':description,'value':value,'day':day,'month':month};
  }
}

 class contactState extends State<contact>{
  var users = new List<User>();
  var users1=new List<User>();
  var users2=new List<User>();
  var users3=new List<User>();
  var users4=new List<User>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      
      });
    });
  }

   _getUsers1() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
        users1=users.sublist(0,4);
      });
    });
  }

    _getUsers2() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
        users2=users.sublist(4,9);
      });
    });
  }

     _getUsers3() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
        users3=users.sublist(9,14);
      });
    });
  }

     _getUsers4() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
        users4=users.sublist(14,19);
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
    
    _getUsers1();
    _getUsers2();
    _getUsers3();
    _getUsers4();
  }

  dispose() {
    super.dispose();
  }

 build(context) {
    return Scaffold(
        appBar: _header(context)
        ,
        body:
                  
  CustomScrollView(
  shrinkWrap: false,
  slivers: <Widget>[
    SliverPadding(
      padding: const EdgeInsets.all(0.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[

        Container(
          margin: EdgeInsets.symmetric(vertical: 0.0),
          height: 230.0,
          decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(0.0),
          color: Colors.blue,
          ),
          width:MediaQuery.of(context).size.width,
          child:
          ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: users.length,
          itemBuilder: (context, index) {
          return _slide(context, users[index].name, "https://zavigne.000webhostapp.com/"+users[index].url,users[index].description,users[index].value,users[index].day,users[index].month,users[index].year);
          },
        ),
        ),
    Container(
          margin: EdgeInsets.symmetric(vertical: 0.0),
          height: 30.0,
          decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(0.0),
          color: Colors.white,
          ),
          width:MediaQuery.of(context).size.width,
          child:
          ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: users.length,
          itemBuilder: (context, index) {
          return _text2(context,users[index].name, "https://zavigne.000webhostapp.com/"+users[index].url,users[index].description,users[index].value,users[index].day,users[index].month,users[index].year);
            },
        ),
        ),
         Container(
          height:150.0,
          width:  MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(0.0),
           color: Colors.lightBlue[100],
          ),
         
          child:
          ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: users1.length,
          itemBuilder: (context, index) {
          return 
          _col2(context, users1[index].name, "https://zavigne.000webhostapp.com/"+users1[index].url,users1[index].description,users1[index].value,users1[index].day,users1[index].month,users1[index].year);       
        
          },
        ),
        ),
 _text(context,"PUBLICATIONS"),
        Container(
          height:150.0,
          width:  MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(0.0),
           color: Colors.lightBlue[100],
          ),
         
          child:
          ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: users2.length,
          itemBuilder: (context, index) {
          return 
          _col2(context, users2[index].name, "https://zavigne.000webhostapp.com/"+users2[index].url,users2[index].description,users2[index].value,users2[index].day,users2[index].month,users2[index].year);        
        
          },
        ),
        ),
 _text(context,"PUBLICATIONS"),
        Container(
          height:150.0,
          width:  MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(0.0),
           color: Colors.lightBlue[100],
          ),
         
          child:
          ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: users3.length,
          itemBuilder: (context, index) {
          return 
          _col2(context, users3[index].name, "https://zavigne.000webhostapp.com/"+users3[index].url,users3[index].description,users3[index].value,users3[index].day,users3[index].month,users3[index].year);       
        
          },
        ),
        ),
         _text(context,"PUBLICATIONS"),
        Container(
          height:150.0,
          width:  MediaQuery.of(context).size.width,        
          decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(0.0),
           color: Colors.lightBlue[100],
          ),
         
          child:
          ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: users4.length,
          itemBuilder: (context, index) {
          return 
          _col2(context, users4[index].name, "https://zavigne.000webhostapp.com/"+users4[index].url,users4[index].description,users4[index].value,users4[index].day,users4[index].month,users4[index].year);     
        
          },
        ),
        )
   



          ]
        )))]),
           persistentFooterButtons: <Widget>[
Row(children:<Widget>[
      Icon(Icons.language),   Text("MMP LTD",style:TextStyle(color:Colors.blue),textAlign:TextAlign.start)
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

Widget _slide(context,name,url,description,value,day,month,year)
{
  return
   Container(
             width: MediaQuery.of(context).size.width,
              child:  GestureDetector(
      child:CachedNetworkImage(
        fit: BoxFit.fill,
         imageUrl: url
                  ),
      onTap: () {
        final data2=Data2(name:name,url:url,value:value,description:description,day:day,month:month,year:year);
             Navigator.push(context,MaterialPageRoute(
          builder:(context) =>viewPage2(
            data:data2,)
        ));
      }
    ) 
   );          
}


Widget _text2(context,name,url,description,value,day,month,year)
{
return

      Container(
                
           decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(10.0),
            color: Colors.blue[500],
            ) ,
            width: 200.0,
            alignment: Alignment.center, padding: const EdgeInsets.all(7.0),
      child:   GestureDetector(
      child:  Text(name, style:TextStyle(color:Colors.white)),
      onTap: () {
        final data=Data2(name:name,url:url,value:value,description:description,month:month,year:year);
             Navigator.push(context,MaterialPageRoute(
          builder:(context) =>viewPage2(
            data:data,)
        ));
      }
    )
   );
       
}



Text _cut(_text)
{

int i=_text.length;
_text=_text;
  
    if(i>3)
    {  _text.substring(0,3); }
    if(i>6)
    {  _text.substring(0,6); }
    if(i>9)
    { _text.substring(0,10); }

return Text(_text);
}

Widget _col(context,name,url)
{
  return
           Container(
           
      child:  GestureDetector(
      child:CachedNetworkImage(
         imageUrl: url,
         width:100.0, height:135.0  
                  ),
      onTap: () {
        final data=Data(name:name,url:url);
             Navigator.push(context,MaterialPageRoute(
          builder:(context) =>viewPage(
            data:data,)
        ));
      }
    ) 
   );
}

Widget _col2(context,name,url,description,value,day,month,year)
{
  return 
      Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      child:   GestureDetector(
      child:CachedNetworkImage(
       imageUrl: url,width:150.0,fit: BoxFit.fitHeight,  
      ),
      onTap: () {
        final data2=Data2(name:name,url:url,value:value,description:description,month:month,year:year);
             Navigator.push(context,MaterialPageRoute(
          builder:(context) =>viewPage2(
            data:data2,)
        ));
      }
    )
   );
}


Widget _text(context,_text)
{
return
  Container(
          
           decoration: new BoxDecoration(
           // borderRadius: new BorderRadius.circular(0.0),
            color: Colors.blue,
            ) ,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text(_text, style:TextStyle(color:Colors.white)),
          );
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
        //     CachedNetworkImage(
        //  imageUrl: 'https://www.getmonero.org/press-kit/symbols/monero-symbol-800.png',
        //   width:50.0,  ),
          Image.asset('assets/logo.png', height:44.0)
          ]),
             automaticallyImplyLeading: false,
          );
}