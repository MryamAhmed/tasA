import 'package:equatable/equatable.dart';
import 'package:taska/blocs/auth_events.dart';

class AuthState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class LoginInitState extends AuthState {}

class LoginLoadingState extends AuthState{}

class UserLoginSuccessState extends AuthState{}

class LoginErrorState extends AuthState {
  final String message ;

  LoginErrorState({required this.message});
}
