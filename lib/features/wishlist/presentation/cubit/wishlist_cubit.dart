import 'package:bookia/features/home/data/models/books_response/product.dart';
import 'package:bookia/features/wishlist/data/repo/whishlist_repo.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistStates> {
  WishlistCubit() : super(WishlistInitialState());

  List<Product> wishlistItems = [];
  Future<void> getWishlist() async {
    emit(WishlistLoadingState());
    var res = await WishlistRepo.getWishlist();

    // if API call failed:
    if (res == null) {
      emit(WishlistErrorState(errorMessage: "Failed to load wishlist"));
      return;
    }

    // if data is empty:
    final items = res.data?.data ?? [];
    if (items.isEmpty) {
      wishlistItems = [];
      emit(EmptyWishlistState());
    } else {
      wishlistItems = items;
      emit(WishlistSuccessState());
    }
  }

  Future<void> removeFromWishlist({required int bookId}) async {
    emit(WishlistLoadingState());
    var res = await WishlistRepo.removeFromWishlist(bookId: bookId);
    if (res == null) {
      emit(WishlistErrorState(errorMessage: "Failed to load wishlist"));
      return;
    }
    final items = res.data?.data ?? [];
    if (items.isEmpty) {
      wishlistItems = [];
      emit(EmptyWishlistState());
    } else {
      wishlistItems = items;
      emit(WishlistSuccessState());
    }
  }
}
