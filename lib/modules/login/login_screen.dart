import 'package:flutter/material.dart';
import 'package:flutter_udemy_az/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                // CircleAvatar(
                //   radius: 60.0,
                //   backgroundColor: Colors.purple.withOpacity(0.44),
                //   child: Image(
                //     image: NetworkImage(
                //       'https://avatars.githubusercontent.com/u/92637403?v=4',
                //     ),
                //   ),
                // ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      defaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'email must not be empty';
                          }
                          return null;
                        },
                        text: 'Email',
                        prefix: Icons.email,
                      ),
                      SizedBox(height: 12.0),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                        suffixPressed: (){
                          setState(() {

                          });
                          isPassword = !isPassword;
                        },
                        isPassword: isPassword,
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {
                            print(emailController.text);
                            print(passwordController.text);
                          }
                        },
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'password is too short ';
                          }
                          return null;
                        },
                        text: 'Password',
                        prefix: Icons.lock,
                      ),
                      SizedBox(height: 12.0),
                      MaterialButton(
                        onPressed: () {},
                        child: Text('Forget Password'),
                      ),
                      SizedBox(height: 20.0),
                      defaultButton(
                        text: 'LOGIN',
                        function: () {
                          if (formKey.currentState!.validate()) {
                            print(emailController.text);
                            print(passwordController.text);
                          }
                        },
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account ?'),
                          MaterialButton(
                            onPressed: () {},
                            child: Text('Register Now'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
