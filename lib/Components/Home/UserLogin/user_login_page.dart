import 'package:flutter/material.dart';
import 'package:university_app/Components/Home/UserLogin/ui_helper_user_login.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

enum Role { student, teacher }

class _UserLoginPageState extends State<UserLoginPage> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  int userType = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiUsersLogin.inputFields(userIdController,
                "Student/Faculity/Alumini Id", Icons.person, false),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                        child: Text("Alumini"),
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
            UiUsersLogin.input_button(() {}, "Login")
          ],
        ),
      ),
    );
  }
}
