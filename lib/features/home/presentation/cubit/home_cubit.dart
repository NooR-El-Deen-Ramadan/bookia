import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/home/data/models/books_response/books_response.dart';
import 'package:bookia/features/home/data/models/books_response/product.dart';
import 'package:bookia/features/home/data/models/slider_response/slider.dart';
import 'package:bookia/features/home/data/models/slider_response/slider_response.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:bookia/features/home/presentation/cubit/home_states.dart';
import 'package:bookia/features/wishlist/data/repo/whishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  List<SliderModel> sliders = [];
  List<Product> bestSellers = [];
  List<Product> newArrivals = [];
  List<Product> allProducts = [];
  List<Product> localWishlist = [];

  Future<void> loadWishlist() async {
    localWishlist = await LocalHelper.getWishlist() ?? [];
  }

  void getHomeData() async {
    emit(HomeLoadingState());

    try {
      final results = await Future.wait([
        HomeRepo.getSlider(),
        HomeRepo.getBestSellers(),
        HomeRepo.getNewArrivals(),
        HomeRepo.getAllProducts(),
      ]);
      sliders = (results[0] as SliderResponse).data?.sliders ?? [];
      bestSellers = (results[1] as BooksResponse).data?.products ?? [];
      newArrivals = (results[2] as BooksResponse).data?.products ?? [];
      allProducts = (results[3] as BooksResponse).data?.products ?? [];
      if (!isClosed) {
        // ✅ prevent emit on closed bloc
        emit(HomeSuccessState());
      }
    } catch (e) {
      emit(HomeErrorState(error: e.toString()));
    }
  }

  Future<void> addRemoveWishlist(int bookId) async {
    emit(HomeLoadingState());

    if (isWishlisted(bookId)) {
      var res = await WishlistRepo.removeFromWishlist(bookId: bookId);
      if (res != null) {
        emit(
          WishListCartState(
            message: "Book removed from wishlist successfully",
          ),
        );
      } else {
        emit(HomeErrorState(error: "Failed to remove from wishlist"));
      }
    } else {
      var res = await WishlistRepo.addToWishlist(bookId: bookId);
      if (res != null) {
        emit(
          WishListCartState(
            message: "Book added to wishlist successfully",
          ),
        );
      } else {
        emit(HomeErrorState(error: "Failed to add to wishlist"));
      }
    }
  }

  Future<void> addToCart(int bookId) async {
    emit(HomeLoadingState());

    var res = await CartRepo.removeFromCart(cartItemId: bookId);
    if (res != null) {
      emit(WishListCartState(
          message: "Added to Cart successfully",
        ),
      );
    } else {
      emit(HomeErrorState(error: "Failed to remove from Cart"));
    }
  }

  bool isWishlisted(int bookId) {
    return localWishlist.any((item) => item.id == bookId);
  }
}
