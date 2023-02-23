import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taska/blocs/auth_bloc.dart';
import 'package:taska/pages/login.dart';
import 'package:taska/pages/onboarding.dart';
import 'package:taska/repo/auth_repo.dart';

import 'blocs/auth_state.dart';


void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (create)=> AuthBloc(LoginInitState(), AuthRepository()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
      ),
    );
  }
}
