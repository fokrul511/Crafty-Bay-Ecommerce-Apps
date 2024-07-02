class Urls {
  static const String _baseUrl = 'http://ecom-api.teamrabbil.com/api';
  static const String homeSlider = '$_baseUrl/ListProductSlider';
  static const String categoryList = '$_baseUrl/CategoryList';

  static String productListbyCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String productListByRemark(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';

  static String productDetails(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';

  static String addToCart = '$_baseUrl/CreateCartList';

  static String emailVerify(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String createWishList(int productId) =>
      '$_baseUrl/CreateWishList/$productId';
}
