import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Image(image: AssetImage('lib/ui/assets/logo.jpg')),
          ),
          Text('Login'.toUpperCase()),
          Form(
              child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  icon: Icon(Icons.account_circle),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Senha',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Entrar"),
              ),
              TextButton.icon(
                icon: Icon(Icons.person),
                onPressed: () {},
                label: Text('Criar Conta'),
              )
            ],
          ))
        ],
      ),
    ));
  }
}
