class ApiEndpoints {
  static const baseUrl = "https://codingarabic.online/api";
  //auth
  static const login = "/login";
  static const register = "/register";
  static const forgetPassword = "/forget-password";

  //home
  static const bestSellers = "/products-bestseller";
  static const newArrivals = "/products-new-arrivals";
  static const allProducts = "/products";
  static const slider = "/sliders";

  //wishlist
  static const wishlist = "/wishlist";
  static const addToWishlist = "/add-to-wishlist";
  static const removeFromWishlist = "/remove-from-wishlist";

  //cart
  static const cart = "/cart";
  static const addToCart = "/add-to-cart";
  static const removeFromCart = "/remove-from-cart";
  static const updateCart = "/update-cart";
}
