import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:contact_list/helpers/contact_helper.dart';
import 'package:image_picker/image_picker.dart';

class ContactPage extends StatefulWidget {
  final Contact? contact;

  ContactPage({this.contact});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late Contact _editedContact;
  bool _userEdited = false;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact!.toMap());
      _nameController.text = _editedContact.name!;
      _emailController.text = _editedContact.email ?? "";
      _phoneController.text = _editedContact.phone ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          appBar: AppBar(
            title: Text(_editedContact.name ?? "Novo contato"),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (_editedContact.name != null &&
                    _editedContact.name!.isNotEmpty) {
                  Navigator.pop(context, _editedContact);
                } else {
                  FocusScope.of(context).requestFocus(_nameFocus);
                }
              },
              child: Icon(Icons.save)),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                GestureDetector(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: _editedContact.img == null
                                ? AssetImage("image/person.png")
                                    as ImageProvider
                                : FileImage(File(_editedContact.img!)))),
                  ),
                  onTap: () {
                    _getFromGallery();
                  },
                ),
                TextField(
                  controller: _nameController,
                  focusNode: _nameFocus,
                  decoration: InputDecoration(labelText: "Nome"),
                  onChanged: ((text) {
                    _userEdited = true;
                    setState(() {
                      _editedContact.name = text;
                    });
                  }),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: ((text) {
                    _userEdited = true;

                    _editedContact.email = text;
                  }),
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: "Número",
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: ((text) {
                    _userEdited = true;

                    _editedContact.phone = text;
                  }),
                ),
              ],
            ),
          ),
        ));
  }

  _getFromGallery() async {
    XFile? file = (await ImagePicker().pickImage(source: ImageSource.gallery));
    if (file == null) {
      return null;
    } else {
      setState(() {
        _editedContact.img = file.path;
      });
    }
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: Text("Contato não salvo"),
              content: Text("Se sair as alterções serão perdidas"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text("Prosseguir"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar"),
                )
              ],
            );
          }));
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
