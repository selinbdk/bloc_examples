import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/post_cubit.dart';

class DetailView extends StatelessWidget {
  const DetailView({required this.postCubit, super.key, this.id});

  final int? id;
  final PostCubit postCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostCubit>.value(
      value: postCubit,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: BlocBuilder<PostCubit, PostState>(
              builder: (context, state) {
                if (state is! PostSuccess) {
                  return const SizedBox.shrink();
                }

                final model = state.data.where((e) => e.id == id).firstOrNull;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('userId: ${model?.userId}'),
                    Text('id: ${model?.id}'),
                    Text('title: ${model?.title}'),
                    Text('body: ${model?.body}'),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
