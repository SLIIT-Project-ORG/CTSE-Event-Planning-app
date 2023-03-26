import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/Package.dart';

class PackageRepo {
  final CollectionReference _packageCollection =
      FirebaseFirestore.instance.collection('packages');

  // Add a new package to the Firestore collection
  // Future<void> addPackage(Package package) async {
  //   final CollectionReference packageCollection =
  //       FirebaseFirestore.instance.collection('packages');

  //   // Create a new document with a default ID
  //   DocumentReference newPackageRef = packageCollection.doc();

  //   await newPackageRef.set({
  //     'name': package.name,
  //     'price': package.price,
  //     'decoration': package.decoration,
  //     'catering': package.catering,
  //     'photography': package.photography,
  //     'music': package.music,
  //   });
  // }

  // Update an existing package in the Firestore collection
  // Future<void> updatePackage(Package package) async {
  //   final CollectionReference packageCollection =
  //       FirebaseFirestore.instance.collection('packages');

  //   // Create a new document with a default ID
  //   DocumentReference newPackageRef = packageCollection.doc();

  //   await _packageCollection.doc(package.id.toString()).update({
  //     'name': package.name,
  //     'price': package.price,
  //     'decoration': package.decoration,
  //     'catering': package.catering,
  //     'photography': package.photography,
  //     'music': package.music,
  //   });
  // }

  // Delete a package from the Firestore collection
  Future<void> deletePackage(String id) async {
    await _packageCollection.doc(id.toString()).delete();
  }

  // Get all packages from the Firestore collection
  Stream<List<Package>> getPackageList() {
    return _packageCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Package.fromSnapshot(doc)).toList());
  }

  // Get a single package from the Firestore collection
  Future<Package?> getPackage(int id) async {
    DocumentSnapshot snapshot =
        await _packageCollection.doc(id.toString()).get();
    if (!snapshot.exists) return null;
    return Package.fromSnapshot(snapshot);
  }

  // Define a function to delete a package
  // Future<void> deletePackage(Package package) async {
  //   try {
  //     // Get a reference to the package document in Firestore
  //     DocumentReference packageRef = FirebaseFirestore.instance
  //         .collection("packages")
  //         .doc(package.id.toString());

  //     // Delete the document
  //     await packageRef.delete();
  //   } catch (e) {
  //     print('Error deleting package: $e');
  //   }
  // }

  // Define a function to add a new package
  Future<void> addPackage(Package package) async {
    try {
      // Get a reference to the packages collection in Firestore
      CollectionReference packagesRef =
          FirebaseFirestore.instance.collection("packages");

      // Create a new document with a default ID
      DocumentReference newPackageRef = packagesRef.doc();

      // Set the data of the new document with the package object
      await newPackageRef.set({
        'name': package.name,
        'price': package.price,
        'decoration': package.decoration,
        'catering': package.catering,
        'photography': package.photography,
        'music': package.music,
      });

      print('Package added with ID: ${newPackageRef.id}');
    } catch (e) {
      print('Error adding package: $e');
    }
  }
}
