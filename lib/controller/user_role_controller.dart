import 'package:get/get.dart';

class UserRoleController extends GetxController {
  // Observable boolean to track user type
  // true = user, false = lawyer
  final RxBool _isUser = true.obs;

  // Getter for isUser
  bool get isUser => _isUser.value;

  // Setter for isUser
  set isUser(bool value) {
    _isUser.value = value;
  }
}
