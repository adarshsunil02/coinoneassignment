import 'package:assignment/authentication/auth_provider.dart';
import 'package:assignment/validation/validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Register",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF3D657),
              letterSpacing: 2,
              height: 1,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: authProvider.nameController,
            validator: (value) => Validator.validateEmptytext(value),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Name',
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFF3F3C31),
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
              fillColor: Colors.grey.withOpacity(0.1),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: authProvider.emailController,
            validator: (value) => Validator.validateEmail(value),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Enter Email / Username',
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFF3F3C31),
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
              fillColor: Colors.grey.withOpacity(0.1),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: authProvider.passwordController,
            validator: (value) => Validator.validatePassword(value),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFF3F3C31),
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
              fillColor: Colors.grey.withOpacity(0.1),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          GestureDetector(
            onTap: () {
              if (formKey.currentState!.validate()) {
                authProvider.handleSignup(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('sign up failed...')));
              }
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFF3D657),
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF3D657).withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C1C1C),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
