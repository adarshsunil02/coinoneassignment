import 'package:assignment/authentication/auth_provider.dart';
import 'package:assignment/validation/validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    

    return Form(
      key: authProvider.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Welcome Back",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1C1C1C),
              letterSpacing: 2,
              height: 1,
            ),
          ),
          const Text(
            "Please login to continue",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF1C1C1C),
              height: 1,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: authProvider.emailController,
            validator: (value) => Validator.validateEmail(value),
            decoration: InputDecoration(
              hintText: 'Email / Username',
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFFD9BC43),
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              fillColor: const Color(0xFFECCB45),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: authProvider.passwordController,
            validator: (value) => Validator.validatePassword(value),
            obscureText: authProvider.obscurePassword,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFFD9BC43),
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              fillColor: const Color(0xFFECCB45),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              suffixIcon: IconButton(onPressed: (){
                authProvider.togglePasswordVisibility();
              }, icon:Icon(
                  authProvider.obscurePassword ? Icons.visibility_off : Icons.visibility,
                ), )
            ),
            
          ),
           const SizedBox(
            height: 16,
          ),
          Row(
            children: <Widget>[
              Checkbox(
               value: authProvider.keepLoggedIn,
                onChanged: (bool? value) {
                  authProvider.setKeepLoggedIn(value ?? false);
                }, 
              ),
              const Text(
                'Keep me logged in',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1C1C1C),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          GestureDetector(
            onTap: () {
              if (authProvider.formKey.currentState!.validate()) {
                authProvider.handleLogin(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('sign in failed...')));
              }
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1C),
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1C1C1C).withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF3D657),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "FORGOT PASSWORD?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1C1C1C),
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
