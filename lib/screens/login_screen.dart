import 'package:chat_app/constant/constants.dart';
import 'package:chat_app/cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';
import 'chat_screen.dart';


class LoginScreen extends StatelessWidget {

  String? email, password;

  bool isLoading = false;

  static String id = 'LoginScreen';
  GlobalKey<FormState> formKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit , LoginState>(
      listener: (context, state) {
       if(state is LoginLoaded){
         isLoading = true ;
       }else if(state is LoginSuccess){
         Navigator.pushNamed(context, ChatScreen.id);
       }else if(state is LoginFailure){
         showSnackBar(context, "Fail Loaded");
       }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(height: 40,),
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scholar Chat',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'pacifico',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70,),
                  Row(
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    obSecure: true,
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Password',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        try {
                          await loginUser();
                          Navigator.pushNamed(context, ChatScreen.id,
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        } catch (ex) {
                          showSnackBar(context, 'there is was an error');
                        }
                        isLoading = false;
                      } else {

                      }
                    },
                    txt: 'LOGIN',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'don\'t have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterScreen.id);
                        },
                        child: Text(
                          ' SIGN UP',
                          style: TextStyle(
                            color: Color(0xffc7ede6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
