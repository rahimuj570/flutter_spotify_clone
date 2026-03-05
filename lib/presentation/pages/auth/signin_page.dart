import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/common/helper/show_snackbar.dart';
import 'package:flutter_spotify_clone/common/widgets/common_appbar.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_images.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
import 'package:flutter_spotify_clone/data/models/auth/requests/signin_user_request.dart';
import 'package:flutter_spotify_clone/presentation/pages/auth/signup_page.dart';
import 'package:flutter_spotify_clone/presentation/pages/root_page.dart';
import 'package:flutter_spotify_clone/presentation/provider/auth/signin_provider.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatelessWidget {
  static const String name = "/signin_page";
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> fkey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: CommonAppbar(
        titleShow: true,
        isLeadingSearch: false,
        actionMenuShow: false,
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  SizedBox(height: 80),
                  Text(
                    'Sign in',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 22),
                  RichText(
                    text: TextSpan(
                      text: 'If you need any support ',
                      style: Theme.of(context).textTheme.bodySmall,
                      children: [
                        TextSpan(
                          text: "click here",
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 38),
                  Form(
                    key: fkey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter Username or Email",
                          ),
                          controller: email,
                          autovalidateMode: .onUserInteraction,
                          validator: (value) => value == ""
                              ? "Need to input a valid email"
                              : null,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffix: GestureDetector(
                              onTap: () {
                                print('object');
                              },
                              child: Icon(Icons.remove_red_eye),
                            ),
                          ),
                          controller: password,
                          validator: (value) => value == ""
                              ? "Need to input a valid password"
                              : null,
                          autovalidateMode: .onUserInteraction,
                        ),
                        SizedBox(height: 16),
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: Text('Reset Password'),
                          ),
                        ),
                        SizedBox(height: 16),
                        Consumer<SigninProvider>(
                          builder: (context, signinProvider, child) =>
                              Visibility(
                                visible:
                                    signinProvider.getIsSigninProcessing ==
                                    false,
                                replacement: Center(
                                  child: CircularProgressIndicator(),
                                ),

                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (fkey.currentState!.validate()) {
                                      await signinProvider.signin(
                                        withPassword: true,
                                        withGoogle: false,
                                        withApple: false,
                                        signinUserRequest: SigninUserRequest(
                                          email: email.text.trim(),
                                          password: password.text.trim(),
                                        ),
                                      );

                                      var r = signinProvider.getResponse;

                                      r.fold(
                                        (l) {
                                          showSnackBar(
                                            context: context,
                                            msg: l,
                                            isSuccess: false,
                                          );
                                        },
                                        (r) {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            RootPage.name,
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: Text("Sign in"),
                                ),
                              ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          spacing: 15,
                          children: [
                            Expanded(child: Divider(thickness: 1)),
                            Text('Or'),
                            Expanded(child: Divider(thickness: 1)),
                          ],
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: .spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final provider = context.read<SigninProvider>();
                                await provider.signin(
                                  withPassword: false,
                                  withGoogle: true,
                                  withApple: false,
                                );

                                var r = provider.getResponse;
                                r.fold(
                                  (l) {
                                    showSnackBar(
                                      context: context,
                                      msg: l,
                                      isSuccess: false,
                                    );
                                  },
                                  (r) {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      RootPage.name,
                                    );
                                  },
                                );
                              },
                              child: Image.asset(AppImages.googleIcon),
                            ),
                            Image.asset(AppImages.appleIcon),
                          ],
                        ),
                        SizedBox(height: 50),
                        RichText(
                          text: TextSpan(
                            text: "Not A Member ? ",
                            style: Theme.of(context).textTheme.bodySmall,
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      SignupPage.name,
                                    );
                                  },
                                text: "Register Now",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
