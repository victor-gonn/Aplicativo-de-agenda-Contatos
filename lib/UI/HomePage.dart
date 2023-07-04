import 'dart:io';

import 'package:contact_list/UI/CadastroPage.dart';
import 'package:contact_list/blocs/bloc/contacts_bloc.dart';
import 'package:contact_list/helpers/contact_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum OrderOptions { orderAz, orderZa }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();
  List<Contact> contacts = [];

  _getAllContacts() {
    helper.getAllContacts().then((list) {
      setState(() {
        contacts = list as List<Contact>;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    _getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contato", ),
          centerTitle: true,
          actions: [
            PopupMenuButton<OrderOptions>(
              itemBuilder: ((context) => <PopupMenuEntry<OrderOptions>>[
                    const PopupMenuItem<OrderOptions>(
                      child: Text("ordenar de A-Z"),
                      value: OrderOptions.orderAz,
                    ),
                    const PopupMenuItem<OrderOptions>(
                      child: Text("ordenar de Z-A"),
                      value: OrderOptions.orderZa,
                    )
                  ]),
              onSelected: _orderList,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _contactRoute();
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(15),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return _contactCard(context, index);
            }));
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: contacts[index].img == null
                            ? AssetImage("image/person.png") as ImageProvider
                            : FileImage(File(contacts[index].img!)))),
              ),
              Padding(padding: EdgeInsets.only(left: 13)),
              Column(
                children: [
                  Text(contacts[index].name ?? "",
                      style: Theme.of(context).textTheme.headline1),
                  Text(contacts[index].phone ?? "",
                      style: Theme.of(context).textTheme.headline2)
                ],
              )
            ],
          ),
        ),
      ),
      onTap: () {
        _showOptions(context, index);
      },
    );
  }

  void _contactRoute({Contact? contact}) async {
    final recContact = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContactPage(
                  contact: contact,
                )));
    if (recContact != null) {
      if (contact != null) {
        await helper.updateContact(recContact);
        _getAllContacts();
      } else {
        await helper.saveContact(recContact);
      }
      _getAllContacts();
    }
  }

  _showOptions(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return BottomSheet(
              onClosing: () {},
              builder: (_) {
                return Container(
                  color: Color.fromARGB(255, 47, 46, 51),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextButton(
                            onPressed: () {
                              launchUrlString('tel: ${contacts[index].phone}');
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Ligar",
                              style: Theme.of(context).textTheme.headline2,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _contactRoute(contact: contacts[index]);
                            },
                            child:
                                Text("Editar", style: Theme.of(context).textTheme.headline2)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextButton(
                            onPressed: () {
                              helper.deleteContact(contacts[index].id!);
                              setState(() {
                                contacts.removeAt(index);
                                Navigator.pop(context);
                              });
                            },
                            child: Text("Deletar",
                                style: Theme.of(context).textTheme.headline2)),
                      ),
                    ],
                  ),
                );
              });
        });
  }

  _orderList(OrderOptions result) {
    switch (result) {
      case OrderOptions.orderAz:
        contacts.sort(((a, b) {
          return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
        }));
        break;
      case OrderOptions.orderZa:
      case OrderOptions.orderAz:
        contacts.sort(((a, b) {
          return b.name!.toLowerCase().compareTo(a.name!.toLowerCase());
        }));
        break;
    }
    setState(() {});
  }
}