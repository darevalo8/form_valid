import 'package:flutter/material.dart';
import 'package:form_validation/src/blocs/login_bloc.dart';
// este sera el InheritedWidget perzonalizado 

class Provider extends InheritedWidget{
  final loginBloc  = LoginBloc();

  Provider({
    Key key , Widget child
  }): super(key:key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  
  static LoginBloc of (BuildContext context){
    // Va a buscar un widget exactamente igual al tipo Provider
    return (context.inheritFromWidgetOfExactType(Provider)as Provider).loginBloc;
  }
}