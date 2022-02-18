import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xrstore/blocs/cart/cart_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
    if (state is CartLoading){
      return CircularProgressIndicator();
    }
    if (state is CartLoaded){
    return Column(
      children: [
        Divider(thickness: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical:
          10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('SUBTOTAL', style: Theme.of(context).textTheme.headline5),
                  Text('\$${state.cart.subtotalString}',
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('DELIVERY FEE', style: Theme.of(context).textTheme
                      .headline5),
                  Text('\$${state.cart.deliveryFeeString}',style:
                  Theme.of(context).textTheme
                      .headline5),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue.withAlpha(50),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(5.0),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TOTAL', style: Theme.of(context).textTheme
                        .headline5.copyWith(color: Colors.white)),
                    Text('\$${state.cart.totalString}',style:
                    Theme.of
                      (context)
                        .textTheme
                        .headline5.copyWith(color: Colors.white)),
                  ],
                ),
              ) ,
            ),
          ],
        ),
      ],
    );
  }
    else {
      return Text('Something went wrong');
    }
  }
);
  }
}
