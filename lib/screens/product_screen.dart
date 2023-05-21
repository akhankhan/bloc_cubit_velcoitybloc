import 'package:blocbuilder_repositoryprovider/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      // body: BlocBuilder<ProductBloc, ProductState>(
      //   builder: (context, state) {
      //     if (state is ProductLoadingState) {
      //       return const Center(
      //         child: CircularProgressIndicator.adaptive(),
      //       );
      //     } else if (state is ProductLoadedState) {
      //       return ListView.builder(
      //         itemCount: state.productModel.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             leading: Text(
      //               state.productModel[index].title.toString(),
      //             ),
      //           );
      //         },
      //       );
      //     } else if (state is ProductErrorState) {
      //       return Center(
      //         child: Text(state.errorMessage),
      //       );
      //     }
      //     return const SizedBox();
      //   },
      // ),

      // body: BlocListener<ProductBloc, ProductState>(
      //   listener: (context, state) {
      //     if (state is ProductLoadedState) {
      //       VxToast.show(context, msg: 'Velocity x Products Loaded');
      //       ScaffoldMessenger.of(context)
      //           .showSnackBar(const SnackBar(content: Text('Data Loaded')));
      //     } else if (state is ProductErrorState) {
      //       VxToast.show(context, msg: 'Velocity x Products Not Loaded');
      //       ScaffoldMessenger.of(context)
      //           .showSnackBar(const SnackBar(content: Text('Data Not Loaded')));
      //     }
      //   },
      //   child: const Center(
      //     child: Text('Bloc Listener'),
      //   ),
      // ),

      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductLoadedState) {
            VxToast.show(context, msg: 'Velocity x Products Loaded');
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Data Loaded')));
          } else if (state is ProductErrorState) {
            VxToast.show(context, msg: 'Velocity x Products Not Loaded');
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Data Not Loaded')));
          }
        },
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is ProductLoadedState) {
            return ListView.builder(
              itemCount: state.productModel.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    state.productModel[index].title.toString(),
                  ),
                );
              },
            );
          } else if (state is ProductErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
