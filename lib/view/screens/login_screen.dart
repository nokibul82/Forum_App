import 'package:flutter/material.dart';
import 'package:forumapp/view/widgets/input_field_widget.dart';
import 'package:get/get.dart';
import '../../controller/authentication.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
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
                hintText: "username",
                obscureText: false,
                textEditingController: _usernameController),
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
                await _authenticationController.login(
                    username: _usernameController.text.trim(),
                    password: _passwordController.text.trim());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                  elevation: 10),
              child: Obx(() {
                return _authenticationController.isLoading.value
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "Login",
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
                  Get.to(() => RegisterScreen());
                },
                child: Text(
                  "Register Instead",
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
