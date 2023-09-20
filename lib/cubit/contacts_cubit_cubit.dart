import 'package:bloc/bloc.dart';
import 'package:contact_list/helpers/contact_helper.dart';
import 'package:equatable/equatable.dart';

part 'contacts_cubit_state.dart';

class ContactsCubitCubit extends Cubit<ContactsCubitState> {
  ContactsCubitCubit({required this.contactHelper}) 
  :  super(ContactsCubitInitial());

final ContactHelper contactHelper;

Future<void> getContacts() async {
  try {
    emit( const ContactCubitLoading());
    final contacts = await contactHelper.getAllContacts();
    emit(ContactCubitLoaded(
      contacts: contacts as List<Contact>));
  } on Exception {
    emit(const ContactCubitError());
  }
}

Future<void> excluirContato(id) async {
  
}

}
