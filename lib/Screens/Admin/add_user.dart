import 'package:flutter/material.dart';
import 'package:mithra/components/rounded_button.dart';
import 'package:mithra/SQLite/sqlite.dart'; // Ensure this path is correct
import 'package:mithra/JsonModels/users.dart';
import 'package:mithra/constants.dart'; // Ensure this path is correct

class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
        backgroundColor: kPrimaryColor,
      ),
      body: const AdminBody(),
    );
  }
}

class AdminBody extends StatefulWidget {
  const AdminBody({Key? key}) : super(key: key);

  @override
  _AdminBodyState createState() => _AdminBodyState();
}

class _AdminBodyState extends State<AdminBody> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
                height: size.height *
                    0.05), // Adjusted height for better positioning
            Image.asset(
              "assets/images/add_user.png",
              height: 150, // Adjust the height as needed
              width: 150, // Adjust the width as needed
            ),
            SizedBox(height: size.height * 0.05),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple.withOpacity(.2),
                    ),
                    child: TextFormField(
                      controller: usernameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username is required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: "Enter Username",
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "Enter Password",
                      ),
                    ),
                  ),
                  RoundedButton(
                    text: "Add User",
                    press: () {
                      if (formKey.currentState!.validate()) {
                        addUser();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addUser() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    var user = Users(
      usrName: usernameController.text,
      usrPassword: passwordController.text,
    );

    try {
      await dbHelper.signup(user);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User added successfully!')),
      );
      Navigator.pop(context); // Navigate back after adding the user
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add user: $e')),
      );
    }
  }
}
