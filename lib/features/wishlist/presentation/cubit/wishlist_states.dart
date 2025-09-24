class WishlistStates {}

class WishlistInitialState extends WishlistStates {}

class WishlistLoadingState extends WishlistStates {}

class WishlistSuccessState extends WishlistStates {}

class EmptyWishlistState extends WishlistStates {}

class WishlistErrorState extends WishlistStates {
  final String errorMessage;
  WishlistErrorState({required this.errorMessage});
}