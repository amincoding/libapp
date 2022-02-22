import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:viplive/core/widgets/custom_buttons.dart';
import 'package:viplive/core/widgets/space_widget.dart';

class CompleteInformationBody extends StatefulWidget {
  const CompleteInformationBody({Key? key}) : super(key: key);

  @override
  State<CompleteInformationBody> createState() =>
      _CompleteInformationBodyState();
}

class _CompleteInformationBodyState extends State<CompleteInformationBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _PhoneNumberController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  bool? _success;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("complete your information"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              VerticalSpace(10),
              TextFormField(
                controller: _fullNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "pls enter your username";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Full name',
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(0xFFCCCCCC),
                      )),
                ),
              ),
              VerticalSpace(2),
              TextFormField(
                controller: _PhoneNumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "pls enter your phone number";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Phone number',
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(0xFFCCCCCC),
                      )),
                ),
              ),
              VerticalSpace(2),
              TextFormField(
                maxLines: 5,
                controller: _adressController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "pls enter your adress";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'adress',
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(0xFFCCCCCC),
                      )),
                ),
              ),
              VerticalSpace(2),
              CustomGeneralButton(
                onTap: () async {},
                text: 'Update',
              )
            ],
          ),
        ),
      ),
    );
  }
}
