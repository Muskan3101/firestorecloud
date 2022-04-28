import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Page"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("data").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: Text("No data found"),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((content){
              return Container(
                child: Text(content["name"]+content["email"]),
              );
            }).toList()
          );
        },
      ),
    );
  }
}
