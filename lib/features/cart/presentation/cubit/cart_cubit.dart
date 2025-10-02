import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_response.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());
  CartResponse? cartResponse;

  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController governrateController = TextEditingController();

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

  updateCart({required int cartItemId, required int quantity}) {
    emit(CartLoadingState());
    CartRepo.updateCart(cartItemId: cartItemId, quantity: quantity).then((
      value,
    ) {
      if (value == null) {
        emit(CartErrorState(errorMessage: "Failed to Update Cart"));
      } else {
        cartResponse = value;
        emit(CartSuccessState());
      }
    });
  }


  Future<void> initData() async {
    final data = await LocalHelper.getUserdata();
    final user = data?.user;
    nameController.text = user?.name ?? '';
    emailController.text = user?.email ?? '';
    addressController.text = user?.address ?? '';
    phoneController.text = user?.phone ?? '';
    governrateController.text =   '';
  }
}
