import 'package:flutter/material.dart';
import 'package:sound_detector/src/helpers/contactTextField.dart';
import 'package:sound_detector/src/helpers/iconTextField.dart';
import 'package:sound_detector/src/helpers/iconsHelper.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final IconTextField iconTextField = IconTextField();
  TextEditingController? nameSurnameController,
      contactController,
      addressController;
  final ContactTextField contactTextField = ContactTextField();

  @override
  void initState() {
    nameSurnameController = TextEditingController();
    contactController = TextEditingController();
    addressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameSurnameController!.dispose();
    contactController!.dispose();
    addressController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile", style: TextStyle(color: Colors.black)),
          elevation: 1,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 20),
              IconTextField.textField(
                  nameSurnameController!,
                  "Full Name",
                  "Enter your name and surname",
                  "Enter Name and Surname",
                  IconHelper.personIcon,
                  1),
              const SizedBox(height: 20),
              contactTextField.contactTextField(
                  context, contactController!, "Mobile Number", "621034569"),
              const SizedBox(height: 20),
              IconTextField.textField(
                  addressController!,
                  "Home Address",
                  "Enter your home address",
                  "Enter your home address",
                  IconHelper.addressIcon,
                  6),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Update"),
                ),
              ),
            ],
          ),
        ));
  }
}
