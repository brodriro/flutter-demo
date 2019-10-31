import 'package:DemoFlutter/presentation/utils/Utils.dart';
import 'package:DemoFlutter/presentation/views/login/bloc/LoginBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String user, password;

  LoginBloc _loginBloc;

  final _emailController = new TextEditingController();

  final _passwordController = new TextEditingController();

  @override
  void initState() {
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ThemeColor.backgroundRow,
      body: BlocProvider<LoginBloc>(
        builder: (context) {
          _loginBloc = LoginBloc();
          return _loginBloc;
        },
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state){
            if (state.isSuccess) {
              _onLoginSuccess(context);
            }
            if (state.isFailure) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Login Failure'), Icon(Icons.error)],
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
            }
            if (state.isSubmitting) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Logging In...'),
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return buildContainer(context, state);
            },
          ),
        ),
      ),
    );
  }

  Container buildContainer(BuildContext context, LoginState state) {
    return new Container(
        color: ThemeColor.primaryDarkColor,
        alignment: Alignment.center,
        padding: new EdgeInsets.all(20.0),
        child: new Form(
          child: new Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                padding:
                    EdgeInsets.only(top: 0, left: 20, bottom: 2, right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: new TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autovalidate: true,
                  validator: (_) {
                    return !state.isEmailValid ? 'Invalid Email' : null;
                  },
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(fontSize: 12),
                      hintText: 'Username',
                      labelText: 'Username'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                padding:
                    EdgeInsets.only(top: 0, left: 20, bottom: 2, right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: new TextFormField(
                  obscureText: true,
                  autovalidate: true,
                  keyboardType: TextInputType.emailAddress,
                  controller: _passwordController,
                  validator: (_) {
                    return !state.isPasswordValid ? 'Invalid Password' : null;
                  },
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(fontSize: 12),
                      hintText: 'Password',
                      labelText: 'Enter your password'),
                ),
              ),
              Container(
                child: new RaisedButton(
                  shape: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: new Text(
                    ' Login ',
                    style: new TextStyle(color: Colors.blue),
                  ),
                  onPressed:
                      isLoginButtonEnabled(state) ? _onFormSubmitted : null,
                  color: Colors.white,
                ),
                margin: new EdgeInsets.only(top: 20.0),
              )
            ],
          ),
        ));
  }

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  _onLoginSuccess(BuildContext context) {
    Navigator.pushReplacementNamed(context, RouteScreen.home);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginWithCredentialsPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
