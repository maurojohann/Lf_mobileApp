import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:mobile_app/routes/app_routes.dart';
import './bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  final LoginBloc loginbloc = GetIt.I.get<LoginBloc>();
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameControler = TextEditingController();
    TextEditingController passwordControler = TextEditingController();

    return BlocProvider(
      create: (_) => loginbloc,
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginErrorState) {
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text(
                    'Erro no Login',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              );
            }
            if (state is LoginLoadedState && state.isValidLogin == true) {
              return Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.VEHICLE_DETAIL);
            }
          },
          child: SingleChildScrollView(
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
                  child: _buildForm(usernameControler, passwordControler),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form _buildForm(TextEditingController usernameControler,
      TextEditingController passwordControler) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: usernameControler,
            decoration: InputDecoration(
              labelText: 'Usuario',
              icon: Icon(Icons.account_circle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 32),
            child: TextFormField(
              controller: passwordControler,
              decoration: InputDecoration(
                labelText: 'Senha',
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
          ),
          RaisedButton(
            onPressed: () {
              loginbloc.add(DoLogingEvent(
                  username: usernameControler.text,
                  password: passwordControler.text));
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
    );
  }
}
