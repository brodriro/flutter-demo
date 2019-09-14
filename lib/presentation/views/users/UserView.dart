import 'package:base_flutter/data/entities/User.dart';

abstract class UserView {
  void onCompleteData(List<User> users);
  void onNetworkError();
}