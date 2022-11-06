import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gellary_task/business_logic/login_cubit/login_cubit.dart';
import 'package:gellary_task/business_logic/login_cubit/login_state.dart';
import 'package:gellary_task/presentations/screens/gallery.dart';
import 'package:gellary_task/presentations/widgets/custom_button.dart';
import 'package:gellary_task/presentations/widgets/tff.dart';
import 'package:gellary_task/presentations/widgets/toast.dart';
import 'package:gellary_task/shared/constants/colors.dart';
import 'package:gellary_task/shared/constants/images.dart';
import 'package:gellary_task/shared/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey emailKey = GlobalKey();

  final GlobalKey passwordKey = GlobalKey();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      emailController.text = 'jalen41@example.org';
      passwordController.text = 'password';
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showToast(
            text: 'Incorrect Details Please try again',
            state: ToastStates.ERROR,
          );
        } else if (state is LoginSuccessStateState) {
          showToast(text: 'Login Success', state: ToastStates.SUCCESS);
          navigateAndFinish(context, const GalleryScreen());
        }
      },
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              Image.asset(
                Images.loginBackgroundGredient,
                fit: BoxFit.fill,
                height: 1.sh,
                width: 1.sw,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 100.h),
                  child: Image.asset(
                    Images.loginBackgroundImage,
                    height: 388.w,
                  ),
                ),
              ),
              Positioned(
                top: -140,
                left: -72,
                child: Image.asset(Images.loginUpperImage),
              ),
              Center(
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  children: [
                    SizedBox(
                      height: 200.h,
                    ),
                    Text(
                      'My\nGallary',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 50.sp,
                          color: ColorsApp.textGrey,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 42.sp),
                        height: 420.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32.sp),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: ColorsApp.white.withOpacity(0.4),
                              width: 1.sw,
                              height: 400.h,
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 48.h,
                                    ),
                                    Text(
                                      'LOG IN',
                                      style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 38.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.0.sp),
                                      child: CustomTextFormField(
                                          key: emailKey,
                                          controller: emailController,
                                          keyboardtype:
                                              TextInputType.emailAddress,
                                          hinttext: 'User Name',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 11.7.sp,
                                              horizontal: 21.4.sp),
                                          cursorColor: ColorsApp.textLightGrey,
                                          border: InputBorder.none,
                                          borderradius:
                                              BorderRadius.circular(50.r),
                                          borderside: BorderSide.none,
                                          fillcolor: ColorsApp.white,
                                          filled: true,
                                          ontap: () {
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 150), () {
                                              Scrollable.ensureVisible(
                                                emailKey.currentContext!,
                                              );
                                            });
                                          },
                                          validate: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'required';
                                            }
                                            return null;
                                          }),
                                    ),
                                    SizedBox(
                                      height: 37.9.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.0.sp),
                                      child: CustomTextFormField(
                                          key: passwordKey,
                                          cursorColor: ColorsApp.textLightGrey,
                                          controller: passwordController,
                                          keyboardtype:
                                              TextInputType.visiblePassword,
                                          hinttext: 'Password',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 11.7.sp,
                                              horizontal: 21.4.sp),
                                          obscuretext: true,
                                          border: InputBorder.none,
                                          borderradius:
                                              BorderRadius.circular(50.r),
                                          borderside: BorderSide.none,
                                          fillcolor: ColorsApp.white,
                                          filled: true,
                                          ontap: () {
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 150), () {
                                              Scrollable.ensureVisible(
                                                passwordKey.currentContext!,
                                              );
                                            });
                                          },
                                          validate: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'required';
                                            }
                                            return null;
                                          }),
                                    ),
                                    SizedBox(
                                      height: 37.9.h,
                                    ),
                                    ConditionalBuilder(
                                      condition: state is! LoginLoadingState,
                                      builder: (context) => Container(
                                        width: 282.42.w,
                                        height: 46.11.h,
                                        decoration: BoxDecoration(
                                            color: ColorsApp.bl,
                                            borderRadius:
                                                BorderRadius.circular(10.0.r)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30.sp),
                                          child: CustomButton(
                                            text: 'SUBMIT',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: ColorsApp.white,
                                              fontFamily: 'Segoe',
                                            ),
                                            textAlign: TextAlign.center,
                                            onpressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                cubit.login(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      fallback: (context) => const Center(
                                          child: CircularProgressIndicator()),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.3.sh,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
