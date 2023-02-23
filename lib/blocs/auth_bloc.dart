import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taska/blocs/auth_events.dart';
import 'package:taska/blocs/auth_state.dart';

import '../repo/auth_repo.dart';

class AuthBloc extends Bloc<AuthEvents,AuthState>{
  AuthRepository repo;
  AuthBloc(AuthState initialState, this.repo) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(AuthEvents events) async* {
    if (events is StartEvent) {
      yield LoginInitState();
    } else if (events is LoginLoadingState){
      yield LoginLoadingState();
      //var data = await repo.login(events.email, events.password)
    }
  }
}