import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:form_validation/src/blocs/validators.dart';

class LoginBloc with Validators {
  // final _emailController  = StreamController<String>.broadcast();
  // final _passwordController  = StreamController<String>.broadcast();
  final _emailController  = BehaviorSubject<String>();
  final _passwordController  = BehaviorSubject<String>();

  // Recuperar los datos del stream
  Stream<String> get emailStream  => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream  => _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream => 
  Observable.combineLatest2(emailStream, passwordStream, (e, p)=> true);

  // Insertar valores al stream
  Function (String) get changeEmail => _emailController.sink.add;
  Function (String) get changePassword => _passwordController.sink.add;


  // Obtener el último valor ingresado a los Streams
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
}