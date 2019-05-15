import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/utils/Utils.dart';
import 'package:base_flutter/presentation/views/login/LoginPresenter.dart';
import 'package:base_flutter/presentation/views/login/LoginView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> implements LoginView {
  LoginPresenter loginPresenter = Injector.inject().resolve<LoginPresenter>();

  String user, password;

  final _formKey = GlobalKey<FormState>();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    initPresenter();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: ThemeColor.backgroundRow,
      body: new Container(
          color: ThemeColor.primaryDarkColor,
          alignment: Alignment.center,
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
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
                    validator: this._validateEmail,
                    keyboardType: TextInputType.emailAddress,
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
                    keyboardType: TextInputType.emailAddress,
                    validator: this._validatePassword,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        labelStyle: TextStyle(fontSize: 12),
                        hintText: 'Password',
                        labelText: 'Enter your password'),
                  ),
                ),
                new Container(
                  child: new RaisedButton(
                    shape: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: new Text(
                      ' Login ',
                      style: new TextStyle(color: Colors.blue),
                    ),
                    onPressed: () => onPressLogin(),
                    color: Colors.white,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          )),
    );
  }

  String _validateEmail(String value) {
    if(value.trim().isEmpty) return "Invalid Username";

    user = value;
    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 6) return 'The Password must be at least 8 characters.';
    password = value;
    return null;
  }

  onPressLogin() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();

      this.loginPresenter.onLoginClick(user, password);
    }
  }

  @override
  onLoginSuccess() {
    Navigator.pushReplacementNamed(
        context,
        RouteScreen.home
    );
  }

  @override
  onNetworkError() {
    debugPrint("onNetworkError");
    return null;
  }

  void initPresenter() {
    this.loginPresenter.start(this);
  }
}
