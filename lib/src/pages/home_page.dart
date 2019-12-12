import 'package:flutter/material.dart';
import 'package:form_validation/src/blocs/provider.dart';
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login validation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Email:  ${bloc.email}'),
          Divider(),
          Text('Password:  ${bloc.password}')
        ],
      ),
    );
  }
}