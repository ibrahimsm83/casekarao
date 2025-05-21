import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewAccountController extends GetxController {
  // Form key
  final formKey = GlobalKey<FormState>();
  
  // Focus nodes
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  
  // Text controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  // Observable variables
  final RxDouble _passwordStrength = 0.0.obs;
  final RxString _password = "".obs;
  
  // Getters
  double get passwordStrength => _passwordStrength.value;
  String get password => _password.value;
  
  @override
  void onInit() {
    super.onInit();
    // Add listener to phone focus node
    phoneFocusNode.addListener(() {
      if (!phoneFocusNode.hasFocus) {
        formatPhoneNumber();
      }
    });
    
    // Add listener to password controller
    passwordController.addListener(() {
      checkPasswordStrength(passwordController.text);
    });
  }
  
  // Format phone number
  void formatPhoneNumber() {
    phoneNumberController.text = phoneNumberController.text.replaceAll(" ", "");
  }
  
  // Check password strength
  void checkPasswordStrength(String password) {
    _password.value = password;
    int strength = 0;
    
    // Conditions to check password strength
    if (password.length >= 8) strength++;
    if (RegExp(r'(?=.*[A-Z])').hasMatch(password)) strength++;
    if (RegExp(r'(?=.*\d)').hasMatch(password)) strength++;
    
    // Convert strength to progress bar value (0.0 to 1.0)
    _passwordStrength.value = strength / 3; // 3 is the max strength level
  }
  
  // Register user
  void register() {
    if (formKey.currentState!.validate()) {
      // Implement registration logic here
      // For now, just print the values
      print('Full Name: ${fullNameController.text}');
      print('Email: ${emailController.text}');
      print('Phone Number: ${phoneNumberController.text}');
      print('Password: ${passwordController.text}');
      
      // You can add API calls or navigation logic here
    }
  }
  
  @override
  void onClose() {
    // Dispose controllers and focus nodes
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    
    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    
    super.onClose();
  }
}
