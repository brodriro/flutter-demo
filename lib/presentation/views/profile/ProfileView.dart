import 'package:base_flutter/data/entities/User.dart';

abstract class ProfileView {
  void onCompleteProfile(User user);
  void onNetworkError();
}
