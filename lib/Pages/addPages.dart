// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:networking/class/dataClass.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({Key? key}) : super(key: key);

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  TextEditingController _tfNama = TextEditingController();
  TextEditingController _tfAvatar = TextEditingController();
  TextEditingController _tfAlamat = TextEditingController();
  TextEditingController _tfEmail = TextEditingController();
  TextEditingController _tfPekerjaan = TextEditingController();
  TextEditingController _tfQuote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Data'),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(children: [
            TextField(
              controller: _tfNama,
              decoration: InputDecoration(
                labelText: 'Masukan Nama',
              ),
            ),
            TextField(
              controller: _tfAvatar,
              decoration: InputDecoration(
                labelText: 'Masukan Avatar',
              ),
            ),
            TextField(
              controller: _tfAlamat,
              decoration: InputDecoration(
                labelText: 'Masukan Alamat',
              ),
            ),
            TextField(
              controller: _tfEmail,
              decoration: InputDecoration(
                labelText: 'Masukan Email',
              ),
            ),
            TextField(
              controller: _tfPekerjaan,
              decoration: InputDecoration(
                labelText: 'Masukan Pekerjaan',
              ),
            ),
            TextField(
              controller: _tfQuote,
              decoration: InputDecoration(
                labelText: 'Masukan Quote',
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {
                cData data = cData(
                  cId: "", 
                  cAvatar: _tfAvatar.text, 
                  cNama: _tfNama.text, 
                  cAlamat: _tfAlamat.text, 
                  cEmail: _tfEmail.text, 
                  cPekerjaan: _tfPekerjaan.text, 
                  cQuote: _tfQuote.text
                );
                Navigator.pop(context, data);
              },
              child: Text('Submit', style: TextStyle(fontSize: 30),),
            ),
          ]),
        ));
  }
}
