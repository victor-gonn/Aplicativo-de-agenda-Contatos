import 'package:bloc/bloc.dart';
import 'package:contact_list/helpers/contact_helper.dart';
import 'package:equatable/equatable.dart';



part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(ContactsLoading()) {
    on<LoadContacts>(_onLoadContacts);
    on<AddContacts>(_onAddContacts);
    on<UpdateContacts>(_onUpdateContacts);
    on<DeleteContacts>(_onDeleteContacts);
  }

  //var repository = locator.get<ContactHelper>();

  void _onLoadContacts(LoadContacts event, Emitter<ContactsState> emit) {
    emit(
      ContactsLoaded(contacts: event.contacts),
    );
  }

  void _onAddContacts(AddContacts event, Emitter<ContactsState> emit) {}

  void _onUpdateContacts(UpdateContacts event, Emitter<ContactsState> emit) {}

  void _onDeleteContacts(DeleteContacts event, Emitter<ContactsState> emit) {}
}
