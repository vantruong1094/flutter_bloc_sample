import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_sample/src/loginForm/login_event.dart';
import 'package:flutter_bloc_sample/src/loginForm/login_state.dart';
import 'package:flutter_bloc_sample/src/validations/validations.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => InitialLoginState();

  final _emailInput = BehaviorSubject<String>();
  final _passwordInput = BehaviorSubject<String>();

  Sink<String> get emailSink => _emailInput.sink;
  Sink<String> get passwordSink => _passwordInput.sink;

  LoginBloc() {
    Observable.combineLatest2(_emailInput, _passwordInput, (email, password) {
      return Validations.isValidEmail(email) && Validations.isValidPassword(password);
    }).listen((onData) {
      print("OnData ====> $onData");
    });
  }

  changeInputEmail(String email) {

  }

  changeInputPassword(String pass) {

  }

  @override
  void dispose() {
    super.dispose();
    _emailInput.close();
    _passwordInput.close();
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
