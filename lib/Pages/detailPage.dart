// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:networking/class/dataClass.dart';

class DetailDataPage extends StatefulWidget {
  final cData data;

  const DetailDataPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailDataPage> createState() => _DetailDataPageState();
}

class _DetailDataPageState extends State<DetailDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Data'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.data.cAvatar),
              radius: 50,
            ),
            ListTile(
              title: Text(
                widget.data.cNama,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                widget.data.cEmail,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Table(
              defaultColumnWidth: IntrinsicColumnWidth(),
              children: [
                TableRow(
                  children: [
                    Text('Alamat: '),
                    SizedBox(
                      width: 20,
                    ),
                    Text(widget.data.cAlamat)
                  ],
                ),
                TableRow(
                  children: [
                    Text('Pekerjaan: '),
                    SizedBox(
                      width: 20,
                    ),
                    Text(widget.data.cPekerjaan)
                  ],
                ),
                TableRow(
                  children: [
                    Text('Quote: '),
                    SizedBox(
                      width: 20,
                    ),
                    Text(widget.data.cQuote)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
