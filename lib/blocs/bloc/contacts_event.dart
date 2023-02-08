part of 'contacts_bloc.dart';

abstract class ContactsEvent extends Equatable {
  const ContactsEvent();

  @override
  List<Object> get props => [];
}


class LoadContacts extends ContactsEvent {
  final List<Contact> contacts;

  LoadContacts({this.contacts = const <Contact>[]});

  @override
  List<Object> get props => [contacts];
}

class AddContacts extends ContactsEvent {
  final Contact contact;

 const AddContacts({required this.contact});

 @override
  List<Object> get props => [contact];
  
}

class UpdateContacts extends ContactsEvent {
  final Contact contact;

 const UpdateContacts({required this.contact});

 @override
  List<Object> get props => [contact];
}

class DeleteContacts extends ContactsEvent {
  final Contact contact;

 const DeleteContacts({required this.contact});

 @override
  List<Object> get props => [contact];
}
