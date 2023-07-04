import 'package:contact_list/blocs/bloc/contacts_bloc.dart';
import 'package:contact_list/helpers/contact_helper.dart';
import 'package:contact_list/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/HomePage.dart';

void main() {
  //SetupGetIt();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ContactHelper.internal,
      child: BlocProvider(
        create: (context) => NotesCubit(contactHelpers: ContactHelper.internal),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          theme: theme(),
        ),
      ),
    );
  }
}
