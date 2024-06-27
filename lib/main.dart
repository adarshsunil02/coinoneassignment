// import 'package:assignment/screen/home_page.dart';
// import 'package:assignment/screen/sign_in.dart';
// import 'package:flutter/material.dart';

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const HomePage(),
//     );
//   }
// }

import 'package:assignment/authentication/auth_provider.dart';
import 'package:assignment/firebase_options.dart';
import 'package:assignment/screen/home_page.dart';
import 'package:assignment/screen/login.dart';
import 'package:assignment/screen/login_option.dart';
import 'package:assignment/screen/signup.dart';
import 'package:assignment/screen/signup_option.dart';
import 'package:assignment/utilits/curve_painter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ChangeNotifierProvider(
      create: (context) => AuthProvider(),
       child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.muktaVaaniTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Consumer<AuthProvider>(
              builder: (context, auth, _) {
                if (auth.keepLoggedIn && auth.user != null) {
                  return HomePage();
                } else {
                  return LogScreen();
                }
              },
            ),
        '/home': (context) => HomePage(),
        '/login': (context) => LogScreen(),
      },

      // LogScreen()
      
    );
  }
}

class LogScreen extends StatelessWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: SingleChildScrollView(child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  authProvider.toggle();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                  height: authProvider.login
                      ? MediaQuery.of(context).size.height * 0.6
                      : MediaQuery.of(context).size.height * 0.4,
                  child: CustomPaint(
                    painter: CurvePainter(authProvider.login),
                    child: Container(
                      padding:
                          EdgeInsets.only(bottom: authProvider.login ? 0 : 55),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            child: authProvider.login ? Login() : LoginOption(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  authProvider.toggle();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                  height: authProvider.login
                      ? MediaQuery.of(context).size.height * 0.4
                      : MediaQuery.of(context).size.height * 0.6,
                  child: Container(
                      color: Colors.transparent,
                      padding:
                          EdgeInsets.only(top: authProvider.login ? 55 : 0),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                            child:
                                !authProvider.login ? SignUp() : SignUpOption(),
                          ),
                        ),
                      )),
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
