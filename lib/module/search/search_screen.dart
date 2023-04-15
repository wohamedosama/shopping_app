import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/cubits/search_model/search_cubit.dart';
import 'package:shopping_app/module/search/build_search_items.dart';
import 'package:shopping_app/shared/components/default%20_form_fields.dart';

import '../../shared/components/divider.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  static String id = 'Setting Screen';
  final GlobalKey formKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    DefaultTextFormFields(
                      onSubmitted: (value) {
                        SearchCubit.get(context).search(value!);
                      },
                      textEditingController: searchController,
                      type: TextInputType.text,
                      prefix: const Icon(Icons.search),
                      label: 'Search',
                    ),
                    const SizedBox(height: 15),
                    if (state is SearchLoadingState)
                      const LinearProgressIndicator(),
                    const SizedBox(height: 15),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => BuildSearchItems(
                            dataList: SearchCubit.get(context)
                                .searchModel!
                                .data!
                                .dataList[index],
                            isOldPrice: false,
                          ),
                          separatorBuilder: (context, index) =>
                              const DividerItem(),
                          itemCount: SearchCubit.get(context)
                              .searchModel!
                              .data!
                              .dataList
                              .length,
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
