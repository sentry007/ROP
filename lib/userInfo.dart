import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InfoFromFirebase extends StatefulWidget {
  const InfoFromFirebase({super.key});

  @override
  State<InfoFromFirebase> createState() => _InfoFromFirebaseState();
}

class _InfoFromFirebaseState extends State<InfoFromFirebase> {
  CollectionReference Baby_data =
      FirebaseFirestore.instance.collection('Baby_data');

  late Stream<QuerySnapshot> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Baby_data.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: data,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.active) {
            QuerySnapshot querySnapshot = snapshot.data['firstname'];
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
