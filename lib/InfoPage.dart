import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({super.key}) {
    _stream = _reference.snapshots();
  }

  CollectionReference _reference =
      FirebaseFirestore.instance.collection('Baby_data');
  // ignore: unused_field

  late Stream<QuerySnapshot> _stream;

  signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
              ],
              title: const Text('Info page'),
              centerTitle: true,
              backgroundColor: Colors.blueGrey,
            ),
            body: StreamBuilder<QuerySnapshot>(
              stream: _stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: Text('Some error occurred ${snapshot.error}'));
                }
                if (snapshot.hasData) {
                  QuerySnapshot querySnapshot = snapshot.data;
                  List<QueryDocumentSnapshot> documents = querySnapshot.docs;
                  List<Map> items = documents
                      .map((e) => {
                            'name': e['name'],
                            'dob': e['dob'],
                            'sex': e['sex'],
                            'motherName': e['motherName'],
                            'fatherName': e['fatherName'],
                            'mobile': e['mobile'],
                            'email': e['email'],
                            'uhid': e['uhid'],
                            'gestationalAge': e['gestationalAge'],
                            'weight': e['weight'],
                            'lengthOfStay': e['lengthOfStay'],
                            'oxygenSupport': e['oxygenSupport'],
                            'highRiskPregnancy': e['highRiskPregnancy'],
                            'twinPregnancy': e['twinPregnancy'],
                            'ivf': e['ivf'],
                            'hemodynamic_instability':
                                e['hemodynamic_instability'],
                            'oxygen_therapy': e['oxygen_therapy'],
                            'mechanical_ventilation':
                                e['mechanical_ventilation'],
                          })
                      .toList();

                  return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map thisItem = items[index];
                        return Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 32,
                              ),
                              Info(
                                lable: "Name",
                                info: "${thisItem['name']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: "DOB",
                                info: "${thisItem['dob']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: "Gender",
                                info: "${thisItem['sex']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: "Mother name",
                                info: "${thisItem['motherName']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: "Father name",
                                info: "${thisItem['fatherName']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: "Mobile No",
                                info: "${thisItem['mobile']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: "Email",
                                info: "${thisItem['email']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: "UHID",
                                info: "${thisItem['uhid']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: "Gestration_Period",
                                info: "${thisItem['gestationalAge']}",
                              ),
                              // SizedBox(
                              //   height: 24,
                              // ),
                              // Info(
                              //   lable: "some stuff",
                              //   info: "${thisItem['sex']}",
                              // ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: "Weight",
                                info: "${thisItem['weight']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: "Length_Of_Stay",
                                info: "${thisItem['lengthOfStay']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: 'Oxygen_Support',
                                info: "${thisItem['oxygenSupport']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: 'High_Risk_Pregnanmcy',
                                info: "${thisItem['highRiskPregnancy']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: "Twin_Prenency",
                                info: " ${thisItem['twinPregnancy']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: "IVF",
                                info: " ${thisItem['ivf']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: "Hemodynamic_instability",
                                info: "${thisItem['hemodynamic_instability']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: "oxygen_therapy",
                                info: " ${thisItem['oxygen_therapy']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Info(
                                lable: "mechanical_ventilation",
                                info: " ${thisItem['mechanical_ventilation']}",
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              // Container(
                              //   child: ElevatedButton(
                              //         //       onPressed: () {}, child: Text('see hospitasl near you')),
                              //         //   width: double.infinity,
                              //         // ),
                            ],
                          ),
                        );
                      });
                }
                return Text('data');
              },
            )
            // SingleChildScrollView(
            //   child: Container(
            //     padding: EdgeInsets.all(20),
            //     child: Column(
            //       children: [
            //         SizedBox(
            //           height: 32,
            //         ),
            //         Info(
            //           lable: "Name",
            //           info: "jon doe",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "DOB",
            //           info: "12 jan 2023",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "Gender",
            //           info: "M",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "Mother name",
            //           info: "Mum doe",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "Father name",
            //           info: "Dad doe",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "Mobile No",
            //           info: "9880077415",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "Email",
            //           info: "abcd@email.com",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "gestationalAge",
            //           info: "9",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "uhid",
            //           info: "wafaef",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "some stuff",
            //           info: "more stuff",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "weight",
            //           info: " 9",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "lengthOfStay",
            //           info: " 9",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "oxygenSupport",
            //           info: " 9",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "highRiskPregnancy",
            //           info: "False",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "TwinPregnancy",
            //           info: " False",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "IVF",
            //           info: " False",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "Hemodynamic_instability",
            //           info: "True",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "oxygen_therapy",
            //           info: " True",
            //         ),
            //         SizedBox(
            //           height: 24,
            //         ),
            //         Info(
            //           lable: "mechanical_ventilation",
            //           info: " True",
            //         ),
            //         SizedBox(
            //           height: 100,
            //         ),
            //         // Container(
            //         //   child: ElevatedButton(
            //         //       onPressed: () {}, child: Text('see hospitasl near you')),
            //         //   width: double.infinity,
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
            ));
  }
}

class Info extends StatelessWidget {
  final String lable;
  final String info;

  const Info({super.key, required this.lable, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Text(
            "${lable}:-",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color.fromARGB(255, 124, 174, 255),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            "${info}".toUpperCase(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
