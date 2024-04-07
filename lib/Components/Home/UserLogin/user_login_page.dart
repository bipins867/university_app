import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:university_app/Components/Home/UserLogin/controller_user_login.dart';
import 'package:university_app/Components/Home/UserLogin/ui_helper_user_login.dart';
import 'package:university_app/Components/Home/home_page.dart';
import 'package:university_app/Store/global_state_management.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

enum Role { student, teacher }

class _UserLoginPageState extends State<UserLoginPage> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final listUserType = ['student', 'faculty', 'alumni'];
  int userType = 0;
  SharedPreferences? _sharedPreferences;

  isNullFields(collegeId, password) {
    if (collegeId == '' || password == '') {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    SharedPreferences.getInstance().then(
      (value) {
        _sharedPreferences = value;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final globalStateHandler = Provider.of<GlobalStateHandler>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Home/mmm-logo.png',
                height: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              UiUsersLogin.inputFields(userIdController,
                  "Student/Faculity/alumni Id", Icons.person, false),
              const SizedBox(
                height: 10,
              ),
              UiUsersLogin.inputFields(
                  passwordController, "Password", Icons.password, true),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "User Type ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    DropdownButton(
                      value: userType,
                      items: const [
                        DropdownMenuItem(
                          value: 0,
                          child: Text("Student"),
                        ),
                        DropdownMenuItem(
                          value: 1,
                          child: Text("Faculty"),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text("alumni"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          userType = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              UiUsersLogin.input_button(() {
                if (isNullFields(
                    userIdController.text, passwordController.text)) {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      title: Text("Please Provide values to the fields!"),
                    ),
                  );
                } else {
                  userLogin(userIdController.text, passwordController.text,
                          listUserType[userType])
                      .then((data) {
                    _sharedPreferences?.setString('token', data["token"]);
                    globalStateHandler.userType = data['userType'];
                    globalStateHandler.setIsLoggedIn(true);
                    globalStateHandler.userInfo = data['userInfo'];
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
                  }).onError(
                    (error, stackTrace) {
                      UiUsersLogin.createErrorAlertBox(
                          context, "Error!", error.toString());
                    },
                  );
                }
              }, "Login"),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
                  },
                  child: const Text("Continue without login."))
            ],
          ),
        ),
      ),
    );
  }
}
