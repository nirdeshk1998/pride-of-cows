class Endpoint {
  Endpoint._();

  static const String baseUrl = 'https://stagingpoc.heptawork.com/api';
  // static const String baseUrl = 'https://poc.cgprojects.in/api';
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
  static const String availablePincodeList = '/customer/availpincodelist';

  // Category
  static const String categoryList = '/customer/categorylist';

  // Category
  static const String home = '/customer/home';

  // Promocode & Offers
  static const String dealsAndOffers = '/customer/offers';
  static const String applyCoupon = '/promocode/applycoupon';
  static const String removeCoupon = '/promocode/removecoupon';

  //My Profile Update
  static const String profileUpdate = 'customer/profileupdate';

  // Products
  static const String productList = '/customer/productlist';
  static const String productDetails = '/customer/productdetail';

  // Cart
  static const String addToCart = '/cart/addtocart';
  static const String removeFromCart = '/cart/removecart';
  static const String updateProductQuantity = '/customer/productdetail';
  static const String userCartList = '/cart/items';

  // Gift Card
  static const String addGiftCard = "customer/addgiftcard";
  static const String editGiftCard = "customer/editgiftcard";

  // Address Book
  static const String addressBookList = '/customer/addressbooklist';
  static const String saveAddress = '/customer/saveaddress';
  static const String updateAddress = '/customer/updateaddress';
  static const String deleteAddress = '/customer/deleteaddress';

  // Orders
  static const String getOrder = '/order/myorder';
  static const String getOrderDetails = '/order/orderdtls';
  static const String editOrder = '/order/orderdtls';

}
