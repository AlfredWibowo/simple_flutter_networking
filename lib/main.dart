// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:networking/Pages/addPages.dart';
import 'package:networking/Pages/detailPage.dart';
import 'package:networking/Services/apiServices.dart';
import 'package:networking/class/dataClass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Service serviceAPI = Service();
  late Future<List<cData>> listData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listData = serviceAPI.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Networking'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: FutureBuilder<List<cData>>(
                future: listData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<cData> isiData = snapshot.data!;
                    return ListView.builder(
                      itemCount: isiData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              //show detail data
                              ShowData(isiData[index].cId);
                            },
                            onLongPress: () {
                              //delete data
                              DeleteData(isiData[index].cId);
                            },
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(isiData[index].cAvatar),
                            ),
                            title: Text(isiData[index].cNama),
                            subtitle: Text(isiData[index].cPekerjaan),
                          ),
                        );
                      },
                    );
                  }
                  else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              )
            ),
          ),

          ElevatedButton(
            onPressed: () async {
              cData requestData = await Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => AddDataPage(),)
              );
              AddData(requestData);
            }, 
            child: Text('Tambah Data'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(45)
            ),
          )
        ],
      ),
    );
  }

  void AddData(cData data) async {
    bool response = await serviceAPI.postData(
      data.cNama, 
      data.cAvatar, 
      data.cAlamat, 
      data.cEmail, 
      data.cPekerjaan, 
      data.cQuote
    );

    if (response) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Add Data Berhasil'))
      );

      setState(() {
        listData = serviceAPI.getAllData();
      });
    }
  }

  void ShowData(String id) async {
    cData response = await serviceAPI.getSingleData(id);
    log('data = ${response.cNama} - ${response.cEmail}');
    //cData response = cData(cId: 'cId', cNama: 'cNama', cAvatar: 'cAvatar', cAlamat: 'cAlamat', cEmail: 'cEmail', cPekerjaan: 'cPekerjaan', cQuote: 'cQuote');
    
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => DetailDataPage(data: response),)
    );
  }

  void DeleteData(String id) async {
    bool response = await serviceAPI.deleteData(id);
    
    if (response) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Delete Data Berhasil'))
      );

      setState(() {
        listData = serviceAPI.getAllData();
      });
    }
    else {
      log('data tidak berhasil dihapus');
    }
  }
}