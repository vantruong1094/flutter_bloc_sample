import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/src/loginForm/login_bloc.dart';

class LoginPageMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginBloc _loginBloc;
  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'Input email',
                labelText: 'Email'),
            onChanged: (email) {
              _loginBloc.emailSink.add(email);
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              hintText: 'Input password',
              labelText: 'Password',
            ),
            onChanged: (password) {
              _loginBloc.passwordSink.add(password);
            },
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 45,
            child: RaisedButton(
              color: Colors.blue,
              child: Text('Login'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
