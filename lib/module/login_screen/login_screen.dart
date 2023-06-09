import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/cubits/login/shop_login_cubit.dart';
import 'package:shopping_app/layout/shop/shop_layout.dart';
import 'package:shopping_app/module/register_screen/register_screen.dart';
import 'package:shopping_app/shared/components/default%20_form_fields.dart';
import 'package:shopping_app/shared/components/default_button.dart';
import 'package:shopping_app/shared/components/flutter_toast.dart';
import 'package:shopping_app/shared/components/navigator_method.dart';
import 'package:shopping_app/shared/network/local/shared_preferences.dart';

import '../../constant.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static String id = loginScreenId;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {
          if (state is ShopLoginSuccess) {
            if (state.shopLoginModel.status!) {
              CacheHelper.saveData(
                      key: 'token', value: state.shopLoginModel.data!.token)
                  .then((value) {
                token = state.shopLoginModel.data!.token!;
                NavigateTo()
                    .navigateAndReplacement(context, const ShopLayout());
              });
            } else {
              ShowFlutterToast.showToast(
                message: state.shopLoginModel.message!,
                state: ToastState.error,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' LOGIN',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          ' Login now to browse our hot offers',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                        ),
                        const SizedBox(height: 30),
                        DefaultTextFormFields(
                          textEditingController: emailController,
                          type: TextInputType.emailAddress,
                          prefix: const Icon(Icons.email_outlined),
                          label: 'Email Address',
                        ),
                        const SizedBox(height: 15),
                        DefaultTextFormFields(
                          onSubmitted: (value) {
                            if (formKey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          isPassword: ShopLoginCubit.get(context).isPassword,
                          suffixIcon: ShopLoginCubit.get(context).suffix,
                          suffixPressed: () {
                            ShopLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          textEditingController: passwordController,
                          type: TextInputType.visiblePassword,
                          prefix: const Icon(Icons.lock_outlined),
                          label: 'Password',
                        ),
                        const SizedBox(height: 30),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoading,
                          builder: (BuildContext context) {
                            return defaultButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ShopLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              text: 'login',
                            );
                          },
                          fallback: (BuildContext context) {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        ),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('dot\'t have an account ?'),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RegisterScreen.id);
                                },
                                child: const Text('Register')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
