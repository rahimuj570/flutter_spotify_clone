import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/common/widgets/common_appbar.dart';
import 'package:flutter_spotify_clone/core/configs/assets/app_images.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';

class SigninPage extends StatelessWidget {
  static const String name = "/signin_page";
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        titleShow: true,
        isLeadingSearch: false,
        actionMenuShow: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                SizedBox(height: 80),
                Text('Sign in', style: Theme.of(context).textTheme.titleLarge),
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
                        decoration: InputDecoration(
                          hintText: "Enter Username or Email",
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Password"),
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
                      ElevatedButton(onPressed: () {}, child: Text("Sign in")),
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
                          text: "Not A Member ? ",
                          style: Theme.of(context).textTheme.bodySmall,
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () {},
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
    );
  }
}
