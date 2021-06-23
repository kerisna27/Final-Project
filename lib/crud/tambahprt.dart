import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TambahQuestion extends StatelessWidget {
  var _controllerNotelepon = TextEditingController();
  var _controllerNama = TextEditingController();
  var _controllerAlamat = TextEditingController();
  var _controllerPertanyaan = TextEditingController();

  void addTambahQuestion() async {
    var url = 'http://192.168.43.76/db_petshop/add_pertanyaan.php';
    var response = await http.post(url, body: {
      'notelepon': _controllerNotelepon.text,
      'nama': _controllerNama.text,
      'alamat': _controllerAlamat.text,
      'pertanyaan': _controllerPertanyaan.text,
    });
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data Pertanyaan'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: _controllerNama,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nama'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: _controllerNotelepon,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nomor HP'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: _controllerAlamat,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Alamat'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextFormField(
              controller: _controllerPertanyaan,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Pertanyaan terkait hewan anda'),
            ),
          ),
          SizedBox(height: 8),
          RaisedButton(
            onPressed: () {
              addTambahQuestion();
            },
            child: Text(
              'Simpan Data',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
