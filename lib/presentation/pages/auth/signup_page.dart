import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/common/widgets/common_appbar.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_images.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';
import 'package:flutter_spotify_clone/presentation/pages/auth/signin_page.dart';

class SignupPage extends StatelessWidget {
  static const String name = "/signup_page";
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        titleShow: true,
        isLeadingSearch: false,
        actionMenuShow: false,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
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
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(hintText: "Full Name"),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(hintText: "Email"),
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
                        ),
                        SizedBox(height: 16),

                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Create Account"),
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
                            Image.asset(AppImages.googleIcon),
                            Image.asset(AppImages.appleIcon),
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
