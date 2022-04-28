import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestorecloud/newpage.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() =>_MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud FireStore"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameTextEditingController,
            decoration: InputDecoration(
                hintText: "name"
            ),
          ),
          TextField(
            controller: emailTextEditingController,
            decoration: InputDecoration(
                hintText: "email id"
            ),
          ),
          ElevatedButton(onPressed: (){
            FirebaseFirestore.instance.collection("data").add({"name":nameTextEditingController.text,"email":emailTextEditingController.text});
          },
              child: Text("Send to Server")
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPage()));
          },
              child: Text("Bring from Server")
          ),
        ],
      ),
    );
  }
}


