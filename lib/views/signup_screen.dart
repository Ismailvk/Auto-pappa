import 'package:auto_pappa/controller/signup/signup_bloc.dart';
import 'package:auto_pappa/resources/components/button_widget.dart';
import 'package:auto_pappa/resources/components/textformfield_widget.dart';
import 'package:auto_pappa/resources/constants/app_colors.dart';
import 'package:auto_pappa/resources/constants/font_styles.dart';
import 'package:auto_pappa/resources/constants/image_urls.dart';
import 'package:auto_pappa/utils/snackbar.dart';
import 'package:auto_pappa/utils/validation.dart';
import 'package:auto_pappa/views/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  GlobalKey<FormState> signupKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(ImageUrls.signupScreen),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Lottie.asset(ImageUrls.signupLottie,
                        height: size.height / 4.5, width: size.width / 3),
                    const Text('WELCOME \n Create Your Account',
                        style: AppFontStyle.normalBoldWhite)
                  ],
                ),
                Text(
                  "AUTO PAPPA",
                  style: TextStyle(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height / 30),
                Container(
                  height: size.height / 1.5,
                  width: size.width / 1.15,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: signupKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Create An Account',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          MyTextField(
                            validator: (value) =>
                                Validation.isEmpty(value, 'Email'),
                            controller: emailController,
                            hintText: 'Email',
                          ),
                          const SizedBox(height: 8),
                          MyTextField(
                            validator: (value) =>
                                Validation.isEmpty(value, "Name"),
                            controller: nameController,
                            hintText: 'Name',
                          ),
                          const SizedBox(height: 8),
                          MyTextField(
                            validator: (value) => Validation.isPassword(value),
                            controller: passwordController,
                            hintText: 'Password',
                          ),
                          const SizedBox(height: 8),
                          MyTextField(
                            validator: (value) => Validation.isPasswordMatch(
                                passwordController.text,
                                confirmPassController.text),
                            controller: confirmPassController,
                            hintText: 'Confirm Password',
                          ),
                          const SizedBox(height: 8),
                          BlocBuilder<SignupBloc, SignupState>(
                            builder: (context, state) {
                              if (state is SignupFailedState) {
                                print('here we go');
                                topSnackbar(
                                    context, state.message, AppColors.red);
                              }
                              bool isLoading = state is SignupLoadingState;
                              return ButtonWidget(
                                isLoading: isLoading,
                                title: 'Register',
                                onPress: () {
                                  // if (signupKey.currentState!.validate()) {
                                  //   Map<String, dynamic> signupData = {
                                  //     'name': nameController.text,
                                  //     'email': emailController.text,
                                  //     'password': passwordController.text,
                                  //   };
                                  //   context.read<SignupBloc>().add(
                                  //         SignupButtonEvent(
                                  //           signupData: signupData,
                                  //         ),
                                  //       );
                                  // }
                                },
                              );
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Expanded(child: Divider(thickness: 1)),
                                SizedBox(width: 8),
                                Text('OR',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(width: 8),
                                Expanded(child: Divider(thickness: 1)),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "You have an account? ",
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Login',
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 17),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
