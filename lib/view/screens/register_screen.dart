import 'package:flutter/material.dart';
import 'package:forumapp/controller/authentication.dart';
import 'package:forumapp/view/screens/login_screen.dart';
import 'package:get/get.dart';
import '../widgets/input_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _authenticationController = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.login,
              size: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Welcome to Forum App",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 30,
            ),
            InputFieldWidget(
                hintText: "Name",
                obscureText: false,
                textEditingController: _nameController),
            const SizedBox(
              height: 20,
            ),
            InputFieldWidget(
                hintText: "Username",
                obscureText: false,
                textEditingController: _usernameController),
            const SizedBox(
              height: 20,
            ),
            InputFieldWidget(
                hintText: "Email",
                obscureText: false,
                textEditingController: _emailController),
            const SizedBox(
              height: 20,
            ),
            InputFieldWidget(
                hintText: "Password",
                obscureText: true,
                textEditingController: _passwordController),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                await _authenticationController.register(
                    name: _nameController.text.trim(),
                    username: _usernameController.text.trim(),
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                  elevation: 10),
              child: Obx(() {
                return _authenticationController.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        "Register",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      );
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Get.to(() => LoginScreen());
                },
                child: Text(
                  "Login Instead",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
