import 'package:event_planning_app/constant.dart';
import 'package:event_planning_app/screen/Vendor/bookdetails.dart';
import 'package:flutter/material.dart';

class BronzePackage extends StatelessWidget {
  const BronzePackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bronze Package'),
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
            Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              color: Colors.white,
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
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: Card(
                color: Colors.white,
                child: Row(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const <Widget>[
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            'Package Name : Bronze Package\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Package Price : \$150\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Included : Flowers,Photography,Dj\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Flower Decaration : Asiri Flora\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Catering Services : Praneetha Catering\n ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Photography : Mr.Dananjaya siriwardhana \n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'DJ Band : GH Band \n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BookDetails()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor, // set the background color
                onPrimary: kBackgroundColor, // set the text color
                padding: EdgeInsets.symmetric(
                    horizontal: 40, vertical: 15), // set the padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), // set the rounded corners
                ),
              ),
              child: Text(
                'Book now',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
