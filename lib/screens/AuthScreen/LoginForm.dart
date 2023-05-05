import 'package:flag/flag.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertest/screens/AuthScreen/authenticationCubit/authentication_cubit.dart';

import '../../../generated/l10n.dart';
import '../../widgets/Language.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: Builder(
        builder: (context) {
          final authenticationCubit = context.watch<AuthenticationCubit>();
          return Scaffold(
            body: Directionality(
              textDirection:
                  authenticationCubit.layoutDirection ?? TextDirection.ltr,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset('assets/logo_2.png')),
                      ),
                    ),
                    BlocBuilder<AuthenticationCubit, AuthenticationState>(
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return CircularProgressIndicator();
                        } else if (state is AuthenticationFailure) {
                          return Text(
                            state.errorMessage,
                            style: const TextStyle(color: Colors.red),
                          );
                        } else if (state is LoginSuccess) {
                          return const Text(
                            "Success",
                            style: TextStyle(color: Colors.green),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DropdownButton<Language>(
                          hint: Text(S.of(context).lang),
                          value: authenticationCubit.selectedLanguage,
                          onChanged: (Language? newValue) {
                            authenticationCubit.languageChanged(newValue);
                          },
                          items: authenticationCubit.languages.map((language) {
                            return DropdownMenuItem<Language>(
                              value: language,
                              // Use a unique identifier as the value
                              child: Row(
                                children: [
                                  Flag.fromString(language.code,
                                      height: 25.h, width: 50.w),
                                  SizedBox(width: 8.w),
                                  Text(language.name),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.w),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Row(
                        children: [
                          Text(S.of(context).signInText,
                              style: TextStyle(fontSize: 30.sp)),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: S.of(context).emailInputLabel,
                        ),
                        onChanged: (value) {
                          authenticationCubit.emailChangedLogin(value);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: S.of(context).passwordInputLabel,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  authenticationCubit.visibilityChanged();
                                },
                                icon: Icon(authenticationCubit.isVisible
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded))),
                        obscureText: !authenticationCubit.isVisible,
                        onChanged: (value) {
                          authenticationCubit.passwordChangedLogin(value);
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.w, right: 10.w, top: 5.h),
                            child: RichText(
                              text: TextSpan(
                                text: S.of(context).new_to_screye,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3177A3)),
                                children: [
                                  TextSpan(
                                    text: S.of(context).registerText,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFF05454),
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context)
                                            .popAndPushNamed('/register');
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0.w),
                      child: OutlinedButton(
                        onPressed: () {
                          authenticationCubit.submitLogin(context);
                        },
                        child: Text(S.of(context).signInText),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        S.of(context).resetPasswordButtonLabel,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFF05454),
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        //TODO forgot password
                                        // Navigator.of(context).popAndPushNamed('/forgot-password');
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}