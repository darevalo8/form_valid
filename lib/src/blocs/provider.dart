import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/src/blocs/login_bloc.dart';
// este sera el InheritedWidget perzonalizado 

class Provider extends InheritedWidget{
  // hacemos singleton para mantener persistencia de la instancia
  static Provider _instancia;

  factory Provider({Key key, Widget child}){

    if(_instancia == null){
      _instancia = new Provider._internal(key: key, child: child,);
    }
    return _instancia;
  }
  Provider._internal({
    Key key , Widget child
  }): super(key:key, child: child);

  final loginBloc  = LoginBloc();
  // antiguo, para dejarlo normal borrar de la line 19 a la 8
  // Provider({
  //   Key key , Widget child
  // }): super(key:key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  
  static LoginBloc of (BuildContext context){
    // Va a buscar un widget exactamente igual al tipo Provider
    return (context.inheritFromWidgetOfExactType(Provider)as Provider).loginBloc;
  }
}