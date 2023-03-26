import 'package:event_planning_app/constant.dart';
import 'package:event_planning_app/model/Package.dart';
import 'package:event_planning_app/repository/PackageRepo.dart';
import 'package:event_planning_app/screen/Vendor/Admin/updatepackage.dart';
import 'package:flutter/material.dart';

class ViewPackage extends StatelessWidget {
  // final List<Package> packages = [
  //   Package(
  //     id: "",
  //     name: 'Package 1',
  //     price: 100,
  //     //included: 'Decoration, Catering, Photography, Music',
  //     decoration: 'Flower decoration',
  //     catering: 'Buffet style catering for 100 guests',
  //     photography: '5 hours of photography with 1 photographer',

  //     music: 'DJ for 3 hours',
  //   ),
  //   Package(
  //     id: "",
  //     name: 'Package 2',
  //     price: 150,
  //     // included: 'Decoration, Catering, Photography',
  //     decoration: 'Balloon decoration',
  //     catering: 'Sit-down dinner for 50 guests',
  //     photography: '3 hours of photography with 1 photographer',
  //     music: 'DJ for 3 hours',
  //   ),
  // ]; // replace with your own data

  @override
  Widget build(BuildContext context) {
    PackageRepo packageRepo = PackageRepo();
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Package'),
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
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: StreamBuilder<List<Package>>(
          stream: packageRepo.getPackageList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            List<Package> packages = snapshot.data!;

            return ListView.builder(
                itemCount: packages.length,
                itemBuilder: (BuildContext context, int index) {
                  final package = packages[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 232, 236, 233),
                      border: Border.all(width: 0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(left: 10, right: 10)),
                        ListTile(
                          title: Text(package.name),
                          textColor: Colors.black,
                          subtitle: Text('\$${package.price.toString()}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                color: Color.fromARGB(255, 34, 172, 71),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Update Package'),
                                        content: Text(
                                            'Are you sure you want to update ${package.name}?'),
                                        actions: [
                                          TextButton(
                                            child: Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text('UPDATE'),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpdatePackage()),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  // TODO: implement update function
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.red,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Delete Package'),
                                        content: Text(
                                            'Are you sure you want to delete ${package.name}?'),
                                        actions: [
                                          TextButton(
                                            child: Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text('DELETE'),
                                            onPressed: () async {
                                              await packageRepo.deletePackage(
                                                  package.id.toString());

                                              // Navigator.of(context).pop();
                                              print("Click Delete");
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
