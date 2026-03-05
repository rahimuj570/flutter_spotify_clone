import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/common/helper/show_snackbar.dart';
import 'package:flutter_spotify_clone/common/widgets/common_appbar.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_images.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
import 'package:flutter_spotify_clone/presentation/pages/auth/signin_page.dart';
import 'package:flutter_spotify_clone/presentation/pages/root_page.dart';
import 'package:flutter_spotify_clone/presentation/provider/auth/signin_provider.dart';
import 'package:flutter_spotify_clone/presentation/provider/auth/signup_provider.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  static const String name = "/signup_page";
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> fKey = GlobalKey<FormState>();
    final TextEditingController fullNameTEC = TextEditingController();
    final TextEditingController emailTEC = TextEditingController();
    final TextEditingController passwordTEC = TextEditingController();
    return Scaffold(
      appBar: CommonAppbar(
        titleShow: true,
        isLeadingSearch: false,
        actionMenuShow: false,
      ),
      body: GestureDetector(
        behavior: .translucent,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          keyboardDismissBehavior: .onDrag,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  SizedBox(height: 80),
                  Text(
                    'Register',
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
                    key: fKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: fullNameTEC,
                          decoration: InputDecoration(hintText: "Full Name"),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: emailTEC,
                          decoration: InputDecoration(hintText: "Email"),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: passwordTEC,
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffix: GestureDetector(
                              onTap: () {
                                print('object');
                              },
                              child: Icon(Icons.remove_red_eye),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),

                        SizedBox(height: 16),
                        Consumer<SignupProvider>(
                          builder: (context, signupProvider, child) =>
                              Visibility(
                                visible:
                                    signupProvider.getIsCreatingUser == false,
                                replacement: Center(
                                  child: CircularProgressIndicator(),
                                ),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await signupProvider.createUser(
                                      fullName: fullNameTEC.text,
                                      email: emailTEC.text,
                                      password: passwordTEC.text,
                                    );

                                    var r = signupProvider.getResponse;
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
                                  child: Text("Create Account"),
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
                            GestureDetector(
                              onTap: () {
                                // To debugging. or now skipping apple login
                                print(
                                  FirebaseAuth
                                      .instance
                                      .currentUser
                                      ?.displayName,
                                );
                                print(FirebaseAuth.instance.currentUser);
                              },
                              child: Image.asset(AppImages.appleIcon),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        RichText(
                          text: TextSpan(
                            text: "Already Have An Account ? ",
                            style: Theme.of(context).textTheme.bodySmall,
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      SigninPage.name,
                                    );
                                  },
                                text: "Sign In",
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
