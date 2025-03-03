import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xrstore/blocs/cart/cart_bloc.dart';
import 'package:xrstore/blocs/wishlist/wishlist_bloc.dart';
import 'package:xrstore/models/models.dart';
import 'package:xrstore/widget/gesture_ar.dart';
import 'package:xrstore/widget/widget.dart';

import '../widget/ar_core_local.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  static Route route({ Product product}){
    return MaterialPageRoute(
        builder: (_)=> ProductScreen(product: product)
    );
  }
  final Product product;
  const ProductScreen({this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: CustomNavBar(screen: routeName, product: product,),
      body: ListView(
        children: [CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          items: [HeroCarouselCard(product: product,)],
        ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [

                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width-10,
                  height: 50,
                  color: Color(0xffeceff4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(color: Color(0xff2e3440)),
                        ),
                        Text(
                          '\₹${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(color: Color(0xff2e3440)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20, vertical: 10),
            child: Column(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ObjectGesturesWidget(product: product,)));
                },
                    style: ElevatedButton.styleFrom(primary: Color(0xff5e81ac)),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(image: AssetImage('assets/images/view.png'),
                          height: 20,
                          color: Color(0xffeceff4),),
                          Text(
                            'VIEW IN AR',
                            style: Theme.of(context).textTheme.headline5.copyWith(color:
                            Colors.white),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
                title: Text('Product Information',
                  style: Theme.of(context)
                      .textTheme
                      .headline3,
                ),
              initiallyExpanded: true,
              children: [
                ListTile(
                  title: Text(
                    'Sunt rationees gratia pius, secundus devirginatoes.'
                        'Est clemens triticum, cesaris.Cum orgia peregrinatione, '
                        'omnes seculaes experientia velox, altus lumenes.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text('Delivery Information',
                style: Theme.of(context)
                    .textTheme
                    .headline3,
              ),
              // initiallyExpanded: true,
              children: [
                ListTile(
                  title: Text(
                    'Sunt rationees gratia pius, secundus devirginatoes.'
                        'Est clemens triticum, cesaris.Cum orgia peregrinatione, '
                        'omnes seculaes experientia velox, altus lumenes.',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )],
            ),
          ),
        ],
      ),

    );
  }
}
