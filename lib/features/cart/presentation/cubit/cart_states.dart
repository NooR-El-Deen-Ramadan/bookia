class CartStates {}

class CartInitialState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartSuccessState extends CartStates {}

class EmptyCartState extends CartStates {}

class CartErrorState extends CartStates {
  final String errorMessage;
  CartErrorState({required this.errorMessage});
}
