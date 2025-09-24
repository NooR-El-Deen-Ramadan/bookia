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

  Future<void> addToWishlist(int bookId) async {
    emit(HomeLoadingState());
    var res = await WishlistRepo.addToWishlist(bookId: bookId);

    if (res != null) {
      emit(HomeSuccessState());
    } else {
      emit(HomeErrorState(error: "Failed to add to wishlist"));
    }
  }
}
