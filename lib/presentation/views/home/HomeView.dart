import 'package:base_flutter/entities/User.dart';

abstract class HomeView {
  void onCompleteProfile(User user);
  void onNetworkError();
}
