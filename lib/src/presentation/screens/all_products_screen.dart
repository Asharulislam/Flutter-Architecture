import 'package:flutter/material.dart';
import 'package:flutter_architecture/src/bloc/all_products/all_products_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: BlocBuilder<AllProductsBloc, AllProductsState>(
        builder: (context, state) {
          if (state is AllProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AllProductsLoaded) {
            return ListView.builder(
              itemCount: state.allProducts.products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.allProducts.products[index].title),
                  subtitle: Image.network(state.allProducts.products[index].thumbnail),
                );
              },
            );
          } else if (state is AllProductsError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Press a button to fetch users'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.read<UserBloc>().add(GetUsersEvent());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
