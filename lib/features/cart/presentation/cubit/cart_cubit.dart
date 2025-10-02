import 'package:bookia/features/cart/data/models/cart_response/cart_response.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());
  CartResponse? cartResponse;
  getCart() {
    emit(CartLoadingState());
    CartRepo.getCart().then((value) {
      if (value == null) {
        emit(CartErrorState(errorMessage: "Failed to load Cart"));
      } else {
        cartResponse = value;
        emit(CartSuccessState());
      }
    });
  }

  removeFromCart({required int cartItemId}) {
    emit(CartLoadingState());
    CartRepo.removeFromCart(cartItemId: cartItemId).then((value) {
      if (value == null) {
        emit(CartErrorState(errorMessage: "Failed to load Cart"));
      } else {
        cartResponse = value;
        emit(CartSuccessState());
      }
    });
  }
}
