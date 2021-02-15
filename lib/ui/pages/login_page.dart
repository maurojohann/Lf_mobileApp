import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/bloc/login_bloc.dart';

import 'second_pge.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //   var deviceSize = MediaQuery.of(context).size;
    LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadedState) {
          return Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SecondPage()));
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 240,
                margin: EdgeInsets.only(bottom: 32),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 5,
                        //   color: Theme.of(context).shadowColor,
                      )
                    ],
                    gradient: LinearGradient(colors: [
                      Theme.of(context).primaryColorLight,
                      Theme.of(context).primaryColorDark,
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(80))),
                child: Image(image: AssetImage('lib/ui/assets/logo.jpg')),
              ),
              Text(
                'Login'.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Usuario',
                          icon: Icon(Icons.account_circle),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 32),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            icon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          bloc.add(DoLogingEvent(
                              username: 'teste', password: 'asdfg1234'));
                        },
                        child: Text("Entrar"),
                      ),
                      TextButton.icon(
                        icon: Icon(Icons.person),
                        onPressed: () {},
                        label: Text('Criar Conta'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
