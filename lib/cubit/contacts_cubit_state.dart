part of 'contacts_cubit_cubit.dart';

abstract class ContactsCubitState extends Equatable {
  const ContactsCubitState();

  @override
  List<Object?> get props => [];
}

class ContactsCubitInitial extends ContactsCubitState {
  const ContactsCubitInitial();
  @override
  List<Object> get props => [];

}

class ContactCubitLoading extends ContactsCubitState {
  const ContactCubitLoading();
  @override
  List<Object> get props => [];

}

class ContactCubitLoaded extends ContactsCubitState {
  const ContactCubitLoaded({
    this.contacts,});

    final List<Contact>? contacts;

    ContactCubitLoaded copyWith({
      List<Contact>? contacts, })
      {
        return ContactCubitLoaded(
          contacts: contacts ?? this.contacts,
        );
      }
  
  
  
  @override
  List<Object?> get props => [contacts];

}

class ContactCubitError extends ContactsCubitState {
  const ContactCubitError();
  @override
  List<Object> get props => [];

}

class ContactCubitSucess extends ContactsCubitState {
  const ContactCubitSucess();
  @override
  List<Object> get props => [];

}


