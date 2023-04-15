import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/cubits/shop/shop_cubit.dart';
import 'package:shopping_app/shared/components/default%20_form_fields.dart';
import 'package:shopping_app/shared/components/sign_out.dart';

import '../../shared/components/default_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        nameController.text = cubit.userModel!.data!.name!;
        emailController.text = cubit.userModel!.data!.email!;
        phoneController.text = cubit.userModel!.data!.phone!;
        return ConditionalBuilder(
          condition: ShopCubit.get(context).userModel != null,
          builder: (BuildContext context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if (state is ShopLoadingUpDateUserState)
                    const LinearProgressIndicator(),
                  const SizedBox(height: 20),
                  DefaultTextFormFields(
                    textEditingController: nameController,
                    type: TextInputType.name,
                    prefix: const Icon(Icons.person),
                    label: 'Name',
                  ),
                  const SizedBox(height: 20),
                  DefaultTextFormFields(
                    textEditingController: emailController,
                    type: TextInputType.emailAddress,
                    prefix: const Icon(Icons.email),
                    label: 'Email Address',
                  ),
                  const SizedBox(height: 20),
                  DefaultTextFormFields(
                    textEditingController: phoneController,
                    type: TextInputType.phone,
                    prefix: const Icon(Icons.phone),
                    label: 'Phone Number',
                  ),
                  const SizedBox(height: 20),
                  defaultButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ShopCubit.get(context).upDateUserDate(
                            name: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text,
                          );
                        }
                      },
                      text: 'Update'),
                  const SizedBox(height: 20),
                  defaultButton(
                      onPressed: () {
                        SignOut.signOut(context);
                      },
                      text: 'Logout'),
                ],
              ),
            ),
          ),
          fallback: (BuildContext context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
