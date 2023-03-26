import 'package:event_planning_app/screen/Task/addTask.dart';
import 'package:event_planning_app/screen/Vendor/Admin/addpackage.dart';
import 'package:event_planning_app/screen/Vendor/VendorScreen.dart';
import 'package:event_planning_app/screen/Vendor/bookdetails.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Event Planning App'),
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
        body: SafeArea(
          child: Column(children: [
            Container(
              height: 410,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/vendor/images/flower.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 220,
              width: 500,
              margin:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/vendor/images/booking.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VendorHome()),
                                );
                              },
                              icon: Icon(Icons.person),
                              label: Text('Vendors'),
                            ),
                            SizedBox(height: 16.0),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddTask()),
                                );
                              },
                              icon: Icon(Icons.checklist),
                              label: Text('Tasks'),
                            ),
                            SizedBox(height: 16.0),
                            ElevatedButton.icon(
                              onPressed: () {
                                // Navigate to venue screen
                              },
                              icon: Icon(Icons.location_on),
                              label: Text('Venues'),
                            ),
                            // SizedBox(height: 16.0),
                            // ElevatedButton.icon(
                            //   onPressed: () {
                            //     // Navigate to guest screen
                            //   },
                            //   icon: Icon(Icons.people),
                            //   label: Text('Guests'),
                            // ),
                            SizedBox(height: 16.0),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddPackage()),
                                );
                              },
                              icon: Icon(Icons.people),
                              label: Text('Admin'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
