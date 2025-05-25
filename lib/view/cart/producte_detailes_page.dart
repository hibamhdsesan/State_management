import 'package:bloc_repositry/view/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProducteDetailesPage extends StatelessWidget {
  ProducteDetailesPage({super.key,required this.id});

  String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<CartBloc>().add(ViewCart());
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: BlocConsumer<CartBloc, CartState>(
          // listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            if (state is Productloaded) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("data")));
            }
          },

          builder: (context, state) {
            if (state is Productloaded) {
              return Column(
                children: [
                  FlutterLogo(size: 300),
                  ListTile(
                    title: Text(state.product.name),
                    subtitle: Text(state.product.price.toString()),
                    leading: CircleAvatar(
                      child: Text(state.product.quintity.toString()),
                    ),
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      context.read<CartBloc>().add(
                        IncreasProductQuintityFromDetails(id: id),
                      );
                    },
                  ),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
