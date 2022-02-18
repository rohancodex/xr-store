part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
  get cart => null;
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}
class CartLoaded extends CartState {
  @override
  final Cart cart;
  const CartLoaded({this.cart = const Cart()});
  @override
  List<Object> get props => [cart];
}
class CartError extends CartState {
  @override
  List<Object> get props => [];
}