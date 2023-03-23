import 'package:event_planning_app/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class VenueManagement extends StatelessWidget{
  const VenueManagement({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Planning APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    );
  }

}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late String HallName;
  late int HAllCApacity;
  late int HallPrice;

  gethallname(hallname){
    this.HallName=hallname;
  }
  gethallcapacity(hallcapacity){
    this.HAllCApacity=int.parse(hallcapacity);
  }
  gethallprice(hallprice){
    this.HallPrice=int.parse(hallprice);
  }
  createData(){
   // print("create");
print(HallPrice);
print(HallName);
print(HAllCApacity);
    DocumentReference documentReference=FirebaseFirestore.instance.collection("Halls").
    doc(HallName);

    Map<String,dynamic>halls={
      "HallName":HallName,
      "HallCapacity":HAllCApacity,
      "HallPrice":HallPrice
    };
    // documentReference.set(halls).whenComplete(() => 
    // {
    //   print("$HallName created")
    // }
    
    // );
    print(halls);
     documentReference.set(halls).onError((error, stackTrace) => {print(error)});
  }
  readData(){
    print("read");
  }
  updateData(){
    print("update");
  }
  deleteData(){
    print("delete");
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: Text("Venue Management"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                
                decoration: InputDecoration(
                  labelText: "Hall Name",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  ),
                ),
                onChanged: (String hallname) {
                  gethallname(hallname);
                },
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                
                decoration: InputDecoration(
                  labelText: "Hall Capacity",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  ),
                ),
                onChanged: (String hallcapacity) {
                  gethallcapacity(hallcapacity);
                },
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: TextFormField(
                
                decoration: InputDecoration(
                  labelText: "Hall Price",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,
                    width: 2.0)
                  ),
                ),
                onChanged: (String hallprice) {
                  gethallprice(hallprice);
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget> [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.blue 
                  ), 
                  child: Text("Create"),
                  onPressed: (){
                    createData();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.green 
                  ), 
                  child: Text("Read"),
                  onPressed: (){
                    readData();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.yellow 
                  ), 
                  child: Text("Update"),
                  onPressed: (){
                    updateData();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.red 
                  ), 
                  child: Text("Delete"),
                  onPressed: (){
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
  