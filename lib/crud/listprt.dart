import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petshop/crud/tambahprt.dart';
import 'package:petshop/crud/pertanyaan.dart';
import 'package:petshop/crud/updateprt.dart';

class ListQuestion extends StatefulWidget {
  @override
  _ListQuestionState createState() => _ListQuestionState();
}

class _ListQuestionState extends State<ListQuestion> {
  List<Question> _listQuestion= [];

  void getListQuestion() async {
    _listQuestion.clear();
    String url = 'http://192.168.43.76/db_petshop/get_list_pertanyaan.php';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      if (responseBody['succes']) {
        List listData = responseBody['data'];
        listData.forEach((itemQuestion) {
          _listQuestion.add(Question.fromMap(itemQuestion));
        });
      } else {}
    } else {
      print('Request Error');
    }
    setState(() {});
  }

  void deleteQuestion(String id) async {
var url = 'http://192.168.43.76/db_petshop/delete_pertanyaan.php';
    var response = await http.post(
      url,
      body: {'id': id},
    );
    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      if (responseBody['succes']) {
        print('Berhasil');
      } else {
        print('Gagal');
      }
    } else {
      print('Request Eror');
    }
    getListQuestion();
  }

  @override
  void initState() {
    getListQuestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Pertanyaan'),
          actions: [
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  getListQuestion();
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TambahQuestion()),
            ).then((value) => getListQuestion());
          },
        ),
        body: _listQuestion.length > 0
            ? ListView.builder(
                itemCount: _listQuestion.length,
                itemBuilder: (context, index) {
                  Question pertanyaan= _listQuestion[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.lightBlue[600],
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(pertanyaan.nama),
                      subtitle: Text("No Hp: " + pertanyaan.notelepon),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateQuestion(
                                  pertanyaan: pertanyaan,
                                )),
                      ).then((value) => getListQuestion()),
                      trailing: Material(
                        child: InkWell(
                          onTap: () {
                            deleteQuestion(pertanyaan.id);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.delete,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text('Data Masih Kosong'),
              ));
  }
}
