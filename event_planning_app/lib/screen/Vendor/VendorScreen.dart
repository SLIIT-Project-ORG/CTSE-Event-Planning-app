import 'package:event_planning_app/constant.dart';
import 'package:event_planning_app/screen/Vendor/bronzepackage.dart';
import 'package:event_planning_app/screen/Vendor/goldpackage.dart';
import 'package:event_planning_app/screen/Vendor/silverpackage.dart';
import 'package:flutter/material.dart';

class VendorHome extends StatelessWidget {
  const VendorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Packages'),
        backgroundColor: kPrimaryColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/vendor/images/vhome.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              color: Color.fromARGB(255, 224, 221, 223),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/vendor/images/gold.png'),
                  const ListTile(
                    title: Text(
                      'Gold Package',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '\$ 250',
                      style: TextStyle(
                          color: Color.fromARGB(137, 234, 17, 17),
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GoldPackage()),
                      );
                    },
                    child: const Text('SELECT',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Color.fromARGB(255, 224, 221, 223),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/vendor/images/silver.png'),
                  const ListTile(
                    title: Text(
                      'Silver Package',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '\$ 200',
                      style: TextStyle(
                          color: Color.fromARGB(137, 234, 17, 17),
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SilverPackage()),
                      );
                    },
                    child: const Text('SELECT',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Color.fromARGB(255, 224, 221, 223),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/vendor/images/bronze.png'),
                  const ListTile(
                    title: Text(
                      'Bronze Package',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '\$ 150',
                      style: TextStyle(
                          color: Color.fromARGB(137, 234, 17, 17),
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BronzePackage()),
                      );
                    },
                    child: const Text('SELECT',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
