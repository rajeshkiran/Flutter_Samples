// ignore_for_file: prefer_const_constructors
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:listview_project/employeeModel.dart';
import 'flowerCollection.dart';

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class newform extends StatefulWidget {
  @override
  _newformState createState() => _newformState();
}

class _newformState extends State<newform> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final idController = TextEditingController();

  int count = 0;
  employeeModel emp = new employeeModel();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: const Text('Fill details'),
          backgroundColor: Colors.blueAccent),
      body: Center(
        child: Column(
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Employee name goes here...',
                hoverColor: Color.fromRGBO(50, 155, 168, 1),
              ),
              style: TextStyle(height: 2, color: Color.fromRGBO(0, 0, 0, 1)),
              controller: nameController,
            ),
            TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Employee number goes here...',
                hoverColor: Color.fromRGBO(50, 155, 168, 1),
              ),
              style: TextStyle(height: 2, color: Color.fromRGBO(0, 0, 0, 1)),
              controller: idController,
            ),
            ElevatedButton(onPressed: onSave, child: Text("Save"))
          ],
        ),
      ),
    );
  }

  void onSave() {
    //flowerCollection coll = new flowerCollection();
    //flowerCollection.add(int.parse(idController.text), nameController.text);
    //employeeModel emp = employeeModel();

    // ignore: deprecated_member_use
    // as employeeModel;
    emp.employees?.empdata[count]?.id = int.parse(idController.text);
    emp.employees?.empdata[count]?.name = nameController.text;
    count++;

    print(emp.employees?.empdata.length);
  }

  createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'my.db');

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}
