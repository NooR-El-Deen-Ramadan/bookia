class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

//wishList
class WishListCartState extends HomeStates {
  final String message;

  WishListCartState({required this.message});
}

class HomeErrorState extends HomeStates {
  final String error;
  HomeErrorState({required this.error});
}
