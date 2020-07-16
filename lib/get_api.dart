import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class GET_API extends StatefulWidget {
  @override
  _GET_APIState createState() => _GET_APIState();
}

class _GET_APIState extends State<GET_API> {
  Future<List<Advice_parent>> _getadvice() async {
    var data = await http.get("https://api.adviceslip.com/advice");

    var jsonData = json.decode(data.body);
    List<Advice_parent> advices_list = [];
    Advice_parent advices = Advice_parent.fromJson(jsonData);
    advices_list.add(advices);
    return advices_list;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return ListView(
      children: <Widget>[
        SizedBox(
          width: 20.0,
          height: 20.0,
        ),
        Container(
          width: queryData.size.width * 0.50,
          height: queryData.size.height * 0.50,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
            ),
            // shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('asset/photo.jpg'), fit: BoxFit.fill),
          ),
        ),
        SizedBox(
          width: 20.0,
          height: 20.0,
        ),
        Expanded(
          child: FutureBuilder(
            future: _getadvice(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: Container(
                      width: 15.0,
                      height: 15.0,
                      child: CircularProgressIndicator()),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, int index) {
                    return Center(
                      child: Container(
                        decoration: new BoxDecoration (
                color: Colors.orange[50]
            ),
                        child: ListTile(
                          title: Text(snapshot.data[index].advice.advice,
                              style: TextStyle(fontSize: 18.0)),
                          leading: Icon(
                            Icons.ac_unit,
                            color: Colors.red,
                            size: 35.0,
                          ),
                          trailing: Icon(
                            Icons.ac_unit,
                            color: Colors.red,
                            size: 35.0,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class Advice_parent {
  Advice advice;
  Advice_parent({this.advice});

  factory Advice_parent.fromJson(Map<String, dynamic> map) {
    return Advice_parent(
      advice: Advice.fromJson(map['slip']),
    );
  }
}

class Advice {
  int id;
  String advice;

  Advice({this.id, this.advice});

  factory Advice.fromJson(Map<String, dynamic> map) {
    return Advice(id: map['id'], advice: map['advice']);
  }
}
