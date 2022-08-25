class Endpoint {
  Endpoint._();

  // static const String baseUrl = 'https://stagingpoc.heptawork.com/api';
  static const String baseUrl = 'https://poc.cgprojects.in/api';
  static const int receiveTimeout = 30000;
  static const int connectionTimeout = 30000;

  // Authentication
  static const String login = '/customer/login';
  static const String verifyOtp = '/customer/otpverifylogin';
  static const String resendMsgOtp = '/customer/resendotp';
  static const String resendCallOtp = '/customer/voiceotp';
  static const String userRegisterOtp = '/customer/register';

  // Data Lists
  static const String stateList = '/customer/statelist';
  static const String cityList = '/customer/citylist';
  static const String pincodeList = '/customer/pincodelist';

  // Home
  static const String categoryList = '/customer/categorylist';

  // Category
  static const String home = '/customer/home';

  // Promocode & Offers
  static const String dealsAndOffers = '/customer/offers';
  static const String applyCoupon = '/promocode/applycoupon';
  static const String removeCoupon = '/promocode/removecoupon';

  // Products
  static const String productList = '/customer/productlist';
  static const String productDetails = '/customer/productdetail';

  // Cart
  static const String addToCart = '/cart/addtocart';
  static const String removeFromCart = '/cart/removecart';
  static const String updateProductQuantity = '/customer/productdetail';
  static const String userCartList = '/cart/items';
}
