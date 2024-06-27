import 'package:assignment/authentication/auth_exception.dart';
import 'package:assignment/authentication/auth_servies.dart';
import 'package:assignment/screen/home_page.dart';
import 'package:assignment/utilits/loading_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final AuthServices authServices = AuthServices();

  bool _login = true;
  String? _errorMessage;
  bool _keepLoggedIn = false;
   bool _obscurePassword = true;
  User? _user;

  bool get keepLoggedIn => _keepLoggedIn;
  User? get user => _user;
 bool get obscurePassword => _obscurePassword;
  bool get login => _login;
  String? get errorMessage => _errorMessage;

  void toggle() {
    _login = !_login;
    notifyListeners();
  }

   void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  AuthProvider() {
    _loadKeepLoggedIn();
    authServices.user.listen((user) {
      _user = user;
      notifyListeners();
    });
  }
GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> handleLogin(BuildContext context) async {
    LoadingDialog.showLoadingDialog(context, "Loading...");

    await authServices
        .loginWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    )
        .then(
      (status) async {
        LoadingDialog.hideLoadingDialog(context);
        if (status == AuthResultStatus.successful) {
          // //////
          if (_keepLoggedIn) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool('keepLoggedIn', true);
          }
          // ///////
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else {
          final errorMsg = AuthExceptionHandler.generateExpetionMessage(status);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMsg)),
          );
        }
      },
    );
  }

  Future<void> handleSignup(BuildContext context) async {
    LoadingDialog.showLoadingDialog(context, "Loading...");

    await authServices
        .signupWithEmailAndPassword(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    )
        .then(
      (status) {
        LoadingDialog.hideLoadingDialog(context);
        if (status == AuthResultStatus.successful) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else {
          final errorMsg = AuthExceptionHandler.generateExpetionMessage(status);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMsg)),
          );
        }
      },
    );
  }

  Future<void> signOut() async {
    try {
      await authServices.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('keepLoggedIn', false);

      _errorMessage = null;
    } catch (e) {
      _errorMessage = "An error occurred while signing out. Please try again.";
      notifyListeners();
    }
  }

  void setKeepLoggedIn(bool value) async {
    _keepLoggedIn = value;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('keepLoggedIn', value);
  }

  Future<void> _loadKeepLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _keepLoggedIn = prefs.getBool('keepLoggedIn') ?? false;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
