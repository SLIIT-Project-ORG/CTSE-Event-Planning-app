import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/constraints.dart/textfield.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override 
  State<AddPage> createState() => _AddpgState();
}

class _AddpgState extends State<AddPage> {
  //form key
  final _formkey = GlobalKey<FormState>();
  // text for textfield
  String email = '';
  String name = '';
  String password = '';
  // textfield
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //Clearing Text
  _cleartxt() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  //Resigtering Users
  CollectionReference addGuest =
      FirebaseFirestore.instance.collection('Guests');
  Future<void> _registerGuest() {
    return addGuest
        .add({'Name': name, 'Email': email, 'Password': password})
        .then((value) => debugPrint('Guest Added'))
        .catchError((_) => debugPrint(' Error In registering User'));
  }

  //Disposing Textfield
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            CustomTextEditField(
              controller: nameController,
              labettxt: 'Name',
            ),
            CustomTextEditField(
              controller: emailController,
              labettxt: 'Email',
              valid: true,
            ),
            CustomTextEditField(
              controller: passwordController,
              labettxt: 'Password',
              visibility: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        name = nameController.text;
                        email = emailController.text;
                        password = passwordController.text;
                        _registerGuest();
                        _cleartxt();
                        Navigator.pop(context);
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  child: const Text('Register'),
                ),
                ElevatedButton(
                  onPressed: _cleartxt,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: const Text('Clear'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
