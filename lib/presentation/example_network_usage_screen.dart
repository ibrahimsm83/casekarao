// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controller/auth_controller.dart';
// import '../core/network/api_response.dart';

// class ExampleNetworkUsageScreen extends StatelessWidget {
//   ExampleNetworkUsageScreen({Key? key}) : super(key: key);

//   // Get the controller
//   // final AuthController _authController = Get.put(AuthController());

//   // Text controllers
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Network Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Email field
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//                 hintText: 'Enter your email',
//               ),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             const SizedBox(height: 16),
            
//             // Password field
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//                 hintText: 'Enter your password',
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 24),
            
//             // Login button
//             Obx(() {
//               final loginStatus = _authController.loginResponse.status;
              
//               return ElevatedButton(
//                 onPressed: loginStatus == Status.LOADING
//                     ? null
//                     : () => _login(),
//                 child: loginStatus == Status.LOADING
//                     ? const CircularProgressIndicator()
//                     : const Text('Login'),
//               );
//             }),
//             const SizedBox(height: 16),
            
//             // Response status
//             Obx(() {
//               final response = _authController.loginResponse;
              
//               if (response.status == Status.COMPLETED) {
//                 return Text(
//                   'Login successful! Welcome, ${response.data?.name}',
//                   style: const TextStyle(color: Colors.green),
//                 );
//               } else if (response.status == Status.ERROR) {
//                 return Text(
//                   'Error: ${response.message}',
//                   style: const TextStyle(color: Colors.red),
//                 );
//               } else if (response.status == Status.INITIAL) {
//                 return const Text('Please login to continue');
//               } else {
//                 return const SizedBox.shrink();
//               }
//             }),
//           ],
//         ),
//       ),
//     );
//   }

//   // Login function
//   void _login() {
//     final email = _emailController.text.trim();
//     final password = _passwordController.text;
    
//     if (email.isEmpty) {
//       Get.snackbar('Error', 'Please enter your email');
//       return;
//     }
    
//     if (password.isEmpty) {
//       Get.snackbar('Error', 'Please enter your password');
//       return;
//     }
    
//     _authController.login(
//       email: email,
//       password: password,
//     );
//   }
// }
