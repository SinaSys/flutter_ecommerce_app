import 'package:e_commerce_flutter/src/common/my_colors.dart';
import 'package:e_commerce_flutter/src/common/my_styles.dart';
import 'package:e_commerce_flutter/src/view/screen/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'home_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/logo/main-logo.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign In", style: MyStyle.pageTitle),
              ],
            ),
            const SizedBox(height: 44),
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                hintText: "Username",
                prefixIcon: const Icon(Icons.person_outline_rounded),
                hintStyle: MyStyle.regularText,
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                prefixIcon: const Icon(Icons.lock_outline),
                hintText: "Password",
                hintStyle: MyStyle.regularText,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Forgot Password?", style: MyStyle.regularText),
                ),
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 12)),
                backgroundColor:
                    MaterialStateProperty.all(MyColors.primaryOrange),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () {
                //Navigator.pushNamed(context, '/HomeScreen()');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              child: Text(
                'Sign In',
                style: MyStyle.pageTitle.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 11),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ", style: MyStyle.regularText),
                InkWell(
                  onTap: () {
                    //Navigator.popAndPushNamed(context, '/sign-up');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
                  },
                  child: Text("Sign Up",
                      style: MyStyle.regularText
                          .copyWith(color: MyColors.primaryOrange)),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  onPressed: null,
                  icon: Image.asset('assets/images/icons/twitter.png'),
                ),
                IconButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  onPressed: null,
                  icon: Image.asset('assets/images/icons/google.png'),
                ),
                IconButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  onPressed: null,
                  icon: Image.asset('assets/images/icons/facebook.png'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
