class Endpoint {
  Endpoint._();

  static const String baseUrl = 'https://stagingpoc.heptawork.com/api/';
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

  // Category
  static const String categoryList = '/customer/categorylist';

  // Promocode & Offers
  static const String dealsAndOffers = '/customer/offers';
  static const String applyCoupon = '/promocode/applycoupon';
  static const String removeCoupon = '/promocode/removecoupon';

  // Products
  static const String productList = '/customer/productlist';
  static const String productDetails = '/customer/productdetail';

  //My Profile Update
static const String profileUpdate='customer/profileupdate';

// Gift Card
static const String addGiftCard="customer/addgiftcard";
static const String editGiftCard="customer/editgiftcard";




}
