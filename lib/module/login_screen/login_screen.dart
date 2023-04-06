import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/cubits/shop_login_cubit.dart';
import 'package:shopping_app/module/register_screen/register_screen.dart';
import 'package:shopping_app/shared/components/default%20_form_fields.dart';
import 'package:shopping_app/shared/components/default_button.dart';

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
        listener: (context, state) {},
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
                          onSaved: (value) {
                            if (formKey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          suffixIcon: const Icon(Icons.visibility),
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
