import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttering/contact.dart';
import 'package:fluttering/viewPage.dart';
import 'package:fluttering/viewPage1.dart';
import 'package:fluttering/viewPage0.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'home.dart';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'dart:io';



 
class Data{
  String name;
  String url;
  String contact;
  String address;
  String about;

  Data({this.name,this.url,this.contact,this.address,this.about});
}

class home extends StatefulWidget{
  createState() => new homeState();
}
var msg="";

class NetworkCheck {
String msg="";
String _status(){
var connectivityResult = (Connectivity().checkConnectivity());
if (connectivityResult == ConnectivityResult.mobile) {
 Text("Connected"); 
 msg= "Connected";
 return  "Connected";
} else if (connectivityResult == ConnectivityResult.wifi) {
 Text("Connected"); 
 msg= "Connected ";
 return  "Connected";
}
else if(connectivityResult == ConnectivityResult.none)
{
   Text("No Internet Connection"); 
   msg= "No Internet Connection";
   return "No Internet Connection";
}
}



}



 
 const baseUrl = "http://zavigne.000webhostapp.com/db/0companies.php";

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
  String logo;
  String ad1;
  String contact;
  String address;
  String about;
  String year;

  User(String name, String logo,String year,String ad1,String contact,String address,String about) {
    this.name = name;
    this.logo = logo;
    this.ad1  = ad1;
    this.contact=contact;
    this.address=address;
    this.about=about;
    this.year = year;
  }

  User.fromJson(Map json)
      : name = json['name'],
        logo = json['logo'],
        ad1  = json['ad1'],
        contact  = json['contact'],
        address  = json['address'],
        about  = json['about'],
        year = json['year'];

  Map toJson() {
    return {'name': name, 'logo': logo,'year':year,'ad1':ad1,'contact':contact,'address':address,'about':about};
  }
}

 class homeState extends State<home>{
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

NetworkCheck n=new NetworkCheck();
n._status();
 msg=n._status();
  
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
     

        //  Text("${msg}"),
// StreamBuilder(
//             stream: Connectivity().onConnectivityChanged,
//             builder: (BuildContext ctxt,
//                 AsyncSnapshot<ConnectivityResult> snapShot) {
//              // if (!snapShot.hasData) return CircularProgressIndicator();
//              var connectivityResult = snapShot.data.connectivityResult;
//               var result = snapShot.data;
//               if(connectivityResult=ConnectivityResult.none)
//               {
//               return Center(child:_text(context,"No Internet Connection!"));
//               }
//               else if(connectivityResult=ConnectivityResult.mobile)
//               {
//                return Center(child: _text(context,'Welcome to home Page'));
//               }
//               else if(connectivityResult=ConnectivityResult.wifi)
//               {
//               return Center(child: _text(context,'Welcome to home Page'));
//               }

//               // switch (result) {
//               //   case ConnectivityResult.none:
//               //     //print("no net");
//               //     return Center(child:_text(context,"No Internet Connection!"));
//               //   case ConnectivityResult.mobile:
//               //   case ConnectivityResult.wifi:
//               //    // print("yes net");
//               //     return Center(
//               //       child: _text(context,'Welcome to home Page'),
//               //     );
//               //   default:
//               //    return Center(child: Text("No Internet Connection!"));
//               // }
//             })
      // ,


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
          return _slide(context, users[index].name, "https://zavigne.000webhostapp.com/"+users[index].logo,users[index].contact,users[index].address,users[index].about);  
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
          return _text2(context,users[index].name,"https://zavigne.000webhostapp.com/"+users[index].logo,users[index].contact,users[index].address,users[index].about);
          },
        ),
        ),
//_text(context,"FEATURED COMPANIES"),
         Container(
          height:150.0,
          width:  MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10.0),
           color: Colors.lightBlue[100],
          ),
         
          child:
          ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: users1.length,
          itemBuilder: (context, index) {
          return 
          _col2(context, users1[index].name, "https://zavigne.000webhostapp.com/"+users1[index].logo,users1[index].contact,users1[index].address,users1[index].about);         
        
          },
        ),
        ),
 //_text(context,"COMPANIES"),
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
               _col2(context, users2[index].name, "https://zavigne.000webhostapp.com/"+users2[index].logo,users2[index].contact,users2[index].address,users2[index].about);        
        
          },
        ),
        ),
 //_text(context,"COMPANIES"),
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
               _col2(context, users3[index].name, "https://zavigne.000webhostapp.com/"+users3[index].logo,users3[index].contact,users3[index].address,users3[index].about);       
        
          },
        ),
        ),
  //       _text(context,"COMPANIES"),
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
          _col2(context, users4[index].name, "https://zavigne.000webhostapp.com/"+users4[index].logo,users4[index].contact,users4[index].address,users4[index].about);         
        
          },
        ),
        )
   



          ]
        )))])
        ,
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

Widget _slide(context,name,url,contact,address,about)
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
        final data=Data(name:name,url:url,contact:contact,address:address,about:about);
             Navigator.push(context,MaterialPageRoute(
          builder:(context) =>viewPage0(
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

Widget _col2(context,name,url,contact,address,about)
{
  return 
      Container(
      width:130.0,
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      child:   
     Column(children: <Widget>[
 GestureDetector(
      child:CachedNetworkImage(
       imageUrl: url,width:150.0,
       height:120.0,
       fit: BoxFit.fitHeight,  
      ),

      onTap: () {
        final data=Data(name:name,url:url,contact:contact,address:address,about:about);
             Navigator.push(context,MaterialPageRoute(
          builder:(context) =>viewPage0(
            data:data,)
        ));
      }
    ),
      Container(
       decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(5.0),
            color: Colors.blue[500],
            ) ,
            width: 150.0,
            height:30.0,
            alignment: Alignment.center, padding: const EdgeInsets.all(7.0),
      child:FittedBox(     
                fit: BoxFit.cover,
                child:
                Row(children: <Widget>[
 Icon(Icons.view_comfy),
  Text(name,style:TextStyle(color:Colors.white)),
    ]
                 
              )
    )
    ,)
    
   
      ],)
     
   
   );
}


Widget _text(context,_text)
{
return
  Container(
           height:30.0,
           decoration: new BoxDecoration(
           // borderRadius: new BorderRadius.circular(0.0),
            color: Colors.black,
            ) ,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text(_text, style:TextStyle(color:Colors.white)),
          );
}

Widget _text2(context,name,url,contact,address,about)
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
      child:Text(name, style:TextStyle(color:Colors.white)),
      onTap: () {
        final data=Data(name:name,url:url,contact:contact,address:address,about:about);
             Navigator.push(context,MaterialPageRoute(
          builder:(context) =>viewPage0(
            data:data,)
        ));
      }
    )
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
           Image.asset('assets/logo.png',  height:44.0)
        
          ]),
      automaticallyImplyLeading: false,
          );
}