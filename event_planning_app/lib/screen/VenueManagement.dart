import 'package:event_planning_app/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VenueManagement extends StatefulWidget {
  const VenueManagement({super.key, required String title});
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<VenueManagement> {
  late String HallName;
  late int HAllCApacity;
  late int HallPrice;
  //final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //final CollectionReference halls = FirebaseFirestore.instance.collection('halls');
  gethallname(hallname) {
    this.HallName = hallname;
  }

  gethallcapacity(hallcapacity) {
    this.HAllCApacity = int.parse(hallcapacity);
  }

  gethallprice(hallprice) {
    this.HallPrice = int.parse(hallprice);
  }

  createData()async {
    // print("create");
   // FirebaseFirestore firestore = FirebaseFirestore.instance;
   // CollectionReference halls = FirebaseFirestore.instance.collection('halls');
    print(HallPrice);
    print(HallName);
    print(HAllCApacity);
    DocumentReference documentReference = FirebaseFirestore.instance.collection("halls").doc(HallName);

    Map<String, dynamic> hallss = {
      "HallName": HallName,
      "HallCapacity": HAllCApacity,
      "HallPrice": HallPrice
    };
   // documentReference
   //     .set(hallss)
   //     .whenComplete(() => {print("$HallName created")});
     print(hallss);

    documentReference
        
        .set(hallss)
        .onError((e, _) => print("Error writing document: $e"));
  }

  readData()async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("halls").doc(HallName);

    documentReference.get().then((value) => print(value.data()));
  }

  updateData() {
    print("update");
  }

  deleteData() {
    print("delete");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Venue Management"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Hall Name",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                ),
                onChanged: (String hallname) {
                  gethallname(hallname);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Hall Capacity",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                ),
                onChanged: (String hallcapacity) {
                  gethallcapacity(hallcapacity);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Hall Price",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                ),
                onChanged: (String hallprice) {
                  gethallprice(hallprice);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text("Create"),
                  onPressed: () {
                    createData();
                  },
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text("Read"),
                  onPressed: () {
                    readData();
                  },
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  child: Text("Update"),
                  onPressed: () {
                    updateData();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Delete"),
                  onPressed: () {
                    deleteData();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
