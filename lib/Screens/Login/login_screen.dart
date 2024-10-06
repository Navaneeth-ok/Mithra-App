import 'package:flutter/material.dart';
import 'package:mithra/JsonModels/users.dart';
import 'package:mithra/SQLite/sqlite.dart';
import 'package:mithra/Screens/Admin/admin_page.dart';
import 'package:mithra/Screens/FrontPage/front_page.dart';
import 'package:mithra/Screens/Signup/signup_screen.dart';
import 'package:mithra/components/rounded_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoginTrue = false;
  bool isVisible = false; // Initialize isVisible with a default value
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child:SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                top: size.height * 0.1,
                child: Text(
                  "ലോഗിൻ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color.fromARGB(255, 142, 41, 243)),
                ),
              ),
              Positioned(
                height: size.height * 0.25,
                top: size.height * 0.2,
                child: Image.asset("assets/images/login234.png"),
              ),
              Positioned(
                top: size.height * 0.525, // Adjust the value to position it below the image
                left: 10,
                right: 10,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.deepPurple.withOpacity(.2),
                  ),
                  child: TextFormField(
                    controller: usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "User ID is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      border: InputBorder.none,
                      hintText: "യൂസർ ഐഡി എഴുതുക",
                    ),
                  ),
              ),),
              const SizedBox(height: 10),
              Positioned(
                top: size.height*0.625,
                left:10,
                right:10,
                child:Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.deepPurple.withOpacity(.2),
                ),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                  obscureText: !isVisible,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.lock),
                    border: InputBorder.none,
                    hintText: "പാസ്സ്‌വേർഡ് എഴുതുക",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                ),),
              ),
              Positioned(
                top:size.height*0.75,
                left:10,
                right:10,
                child:RoundedButton(
                text: "ലോഗിൻ",
                press: () {
                  if (formKey.currentState!.validate()) {
                    login();
                  }
                },
                key: const Key("Roundedbutton_key"),
              ),),
              Positioned(
                top:size.height*0.85,
                left:0,
                right:0,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("അക്കൗണ്ട് ഇല്ലേ?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: const Text("രജിസ്റ്റർ ചെയ്യൂ"),
                    )
                  ],
                ),),
              if (isLoginTrue)
                Positioned(
                  top: size.height * 0.725,
                  left: 85,
                  right: 15,
                  child: const Text(
                    'Invalid username or password',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    ),);
  }

  void login() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    bool isAdmin = (usernameController.text == 'admin' &&
        passwordController.text == 'admin123');

    if (isAdmin) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminPage()),
      );
      return;
    }

    var loggedIn = await dbHelper.login(Users(
      usrName: usernameController.text,
      usrPassword: passwordController.text,
    ));

    if (loggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CompleteScreen()), // Ensure this page exists
      );
    } else {
      setState(() {
        isLoginTrue = true;
      });
    }
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}
