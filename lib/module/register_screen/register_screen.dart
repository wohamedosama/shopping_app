import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/cubits/register/register_cubit.dart';
import 'package:shopping_app/layout/shop/shop_layout.dart';
import 'package:shopping_app/shared/components/default%20_form_fields.dart';
import 'package:shopping_app/shared/components/default_button.dart';
import 'package:shopping_app/shared/components/flutter_toast.dart';
import 'package:shopping_app/shared/components/navigator_method.dart';
import 'package:shopping_app/shared/network/local/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static String id = registerScreenId;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          if (state.shopLoginModel.status!) {
            CacheHelper.saveData(
                    key: 'token', value: state.shopLoginModel.data!.token)
                .then((value) {
              token = state.shopLoginModel.data!.token!;
              NavigateTo().navigateAndReplacement(context, const ShopLayout());
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
                        ' REGISTER',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        ' Login now to browse our hot offers',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                      ),
                      const SizedBox(height: 30),
                      DefaultTextFormFields(
                        textEditingController: nameController,
                        type: TextInputType.name,
                        prefix: const Icon(Icons.person),
                        label: 'User Name',
                      ),
                      const SizedBox(height: 15),
                      DefaultTextFormFields(
                        textEditingController: emailController,
                        type: TextInputType.emailAddress,
                        prefix: const Icon(Icons.email_outlined),
                        label: 'Email Address',
                      ),
                      const SizedBox(height: 15),
                      DefaultTextFormFields(
                        onSubmitted: (value) {
                          // if (formKey.currentState!.validate()) {
                          //   RegisterCubit.get(context).userRegister(
                          //     email: emailController.text,
                          //     password: passwordController.text,
                          //     phone: phoneController.text,
                          //     userName: nameController.text,
                          //   );
                          // }
                        },
                        isPassword: RegisterCubit.get(context).isPassword,
                        suffixIcon: RegisterCubit.get(context).suffix,
                        suffixPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                        textEditingController: passwordController,
                        type: TextInputType.visiblePassword,
                        prefix: const Icon(Icons.lock_outlined),
                        label: 'Password',
                      ),
                      const SizedBox(height: 15),
                      DefaultTextFormFields(
                        textEditingController: phoneController,
                        type: TextInputType.phone,
                        prefix: const Icon(Icons.phone),
                        label: 'Phone Number',
                      ),
                      const SizedBox(height: 30),
                      ConditionalBuilder(
                        condition: state is! RegisterLoadingState,
                        builder: (BuildContext context) {
                          return defaultButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  userName: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            text: 'Register',
                          );
                        },
                        fallback: (BuildContext context) {
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
