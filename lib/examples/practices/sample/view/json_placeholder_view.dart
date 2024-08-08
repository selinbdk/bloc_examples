import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/post_cubit.dart';
import '../repository/repository.dart';
import 'detail_view.dart';

class JsonPlaceholderView extends StatelessWidget {
  const JsonPlaceholderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(TextRepository()),
      child: const _JsonPlaceholderView(),
    );
  }
}

class _JsonPlaceholderView extends StatelessWidget {
  const _JsonPlaceholderView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 108, 138, 183),
        centerTitle: true,
        title: const Text(
          'Json PlaceHolder App',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () => context.read<PostCubit>().fetchData(),
        icon: const Icon(Icons.get_app),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostFailure) {
            return Center(child: Text(state.message));
          } else if (state is PostDisconnected) {
            return const Center(child: Text('Please check your internet connection.'));
          } else if (state is PostSuccess) {
            return ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                final data = state.data[index];
                return Card(
                  color: const Color.fromARGB(255, 191, 209, 236),
                  child: ListTile(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailView(
                            id: data.id,
                            postCubit: context.read<PostCubit>(),
                          ),
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 30,
                    ),
                    title: Text(
                      data.title ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                    subtitle: Text(
                      data.body ?? '',
                      style: const TextStyle(
                        //color: Colors.black,
                        fontSize: 5,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
