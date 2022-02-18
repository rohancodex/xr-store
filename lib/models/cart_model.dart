import 'package:equatable/equatable.dart';
import 'package:xrstore/models/models.dart';

class Cart extends Equatable{
  final List<Product> products;
  const Cart({this.products = const <Product>[]});
  @override
  List<Object> get props => [products];

  Map productQuantity(products){
    var quantity = Map();
    products.forEach((product) { 
      if (!quantity.containsKey(product)){
        quantity[product] = 1;
      }
      else{
        quantity[product]+=1;
      }
    });
    return quantity;
  }


  double get subtotal =>
        products.fold(0, (total, current) => total + current.price);
  double deliveryFee(subtotal){
    if (subtotal >=30.0){ return 0.0;}
    else{return 10.0;}
  }
  String freeDelivery(subtotal, deliveryFee){
    if (subtotal >= deliveryFee){
      return ('You have FREE DELIVERY');
    }
    else{
      double missing = 30.0-subtotal;
      return ('Add \$${missing.toStringAsFixed(2)} for FREE DELIVERY');
    }
  }
  double get total => subtotal + deliveryFee(subtotal);
  String get subtotalString => subtotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal,deliveryFee(subtotal));
  String get totalString => total.toStringAsFixed(2);



}