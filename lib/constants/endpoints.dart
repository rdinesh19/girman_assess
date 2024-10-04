//*This is page used for reference the all the endpoints

/// map key
const String kGoogleApiKey =
    "AIzaSyDmPkp-0M-bHr8_PIylFcUQJIAaDn0DQ3Y"; // latest

const String baseUrl = "https://xpanz-test.dotcod.in/api"; //dev
const String baseUrl1 = "https://xpanz-test.dotcod.in/api/v1";

///  end points
///  map
const String googleApisBaseUrl = "https://maps.googleapis.com/maps/api/place";
// {"device":"${deviceInfo.deviceName}","app":"mobile","appType": "${deviceInfo.appType == "android"?"android":"ios"}",
// "device_type":2,"os":"${deviceInfo.deviceVersion}","osVersion":"${deviceInfo.deviceVersion}","browser":"null"}
//http://3.6.108.18/api/v1/customer/auth/generate-otp


const String generateOtp = "/v1/customer/auth/generate-otp"; // with out token
const String loginPoint = "/v1/customer/auth/login"; //using otp verify
const String refreshTokenUrl = "/v1/customer/auth/refresh-token";
const String updateFvmUrl = "/customer/profile/fcm-token"; // fvm
const String register = "/sign-up/customers/register";
const String getProfile = "/customer/profile";
const String getStoreListUrl = "/customer/store/list";
const String getStoreDetail = "/customer/store/upi/";
const String getProductCategory = "/customer/store-products/product-category/list";
const String getStoreCategory = "/customer/master/store-category/list";
const String getProducts = "/customer/store-products/list";
const String getCurrency = "/customer/currency/list";
const String getCurrencyRateUrl = "/customer/coin-rate/list";
const String getSingleStoreListUrl = "/customer/store-products/store/category";
const String getProductVariantList = "/customer/store-products/variants/list";

/// address
const String addAddress = "/customer/address";
const String updateAddress = "/customer/address/";
const String getAddress = "/customer/address/list";

/// cart
const String addCart = "/customer/cart/product";
const String updateCart = "/customer/cart/product";
const String clearCart = "/customer/cart";
const String getCart = "/customer/cart/product/list";

/// order
const String placeOrder = "/customer/order";
const String getOrders = "/customer/order/list";
const String orderRefundTransaction = "/customer/refund-transaction";

/// payment
const String paymentCalculateUrl = "/customer/payment/calculation";
const String savePaymentUrl = "/customer/payment";
const String initialPaymentUrl = "/customer/payment/gateway/";
const String paymentDetailsUrl = "/customer/payment/details/";
const String gatewaySuccessUrl = "/customer/payment/gateway/success/";

const String transferToBankUrl = "/customer/transfer-to-bank";
const String withdrawListUrl = "/customer/transfer-to-bank/list";


const String getPaymentList="/customer/payment/list";

/// coin
const String coinListUrl = "/customer/customer-ledger/list";
//const String coinLedgerBalanceUrl = "/customer/customer-ledger/balance";
const String coinLedgerBalanceUrl = "/customer/coin-ledger/balance";
const String coinLedgerListUrl = "/customer/coin-ledger/list";

/// reward

const String rewardCountUrl = "/customer/rewards/count";
const String coinHistUrl = "/customer/coin-ledger/coins-breakdown";
const String lottoFaqUrl = "/customer/faq/list";
//spin
const String spinRewardHistoryUrl = "/customer/coin-ledger/spin-rewards/history";
const String dailySpinRewardUrl = "/customer/spins/daily-spin";
const String claimDailyUrl = "/customer/spins/claim-daily-spin";
const String spinItemListUrl = "/customer/spins/list-spin-items";
const String claimPurchaseUrl = "/customer/spins/claim-purchase-spin/";
//lotto
const String getLottoListUrl = "/customer/customer-lotto/list";
const String getMyWinningsUrl = "/customer/customer-lotto/my-winnings";
const String getOthersWinListUrl = "/customer/lotto-winner/list";
//



/// offer
const String offersUrl = "/customer/store/offers/pay-at-store/";

/// coupons
const String cartCouponUrl = "/customer/coupons/cart-order/";
const String storeCouponsUrl = "/customer/coupons/pay-at-store/";
const String couponListUrl = "/customer/coupons/list";
const String couponDetailUrl = "/customer/physical-coupon/serialNo/";
const String addCouponUrl = "/customer/physical-coupon";
/// giftCard
const String giftCardListUrl = "/customer/gift-card/list";
const String giftCardTrackListUrl = "/customer/online-gift-card/tracking/list";
const String onlineGiftCardListUrl = "/customer/online-gift-card/list";
const String giftCardDetailsUrl = "/customer/gift-card/serialNo/";
const String giftCardActiveUrl = "/customer/gift-card/activate";
const String giftCardPurchaseUrl = "/customer/online-gift-card/purchase/";

/// location list
const String locationListUrl = "/customer/platform-locations/list";
const String autoCompleteUrl = "$googleApisBaseUrl/autocomplete/json?input=";
const String geocodeUrl = "$googleApisBaseUrl/details/json";

//profile_image
const String uploadDocUrl = "/customer/uploads";

//profile change mobileNo
const String generateMobileOtp = "/customer/profile/mobile";
const String verifyMobileOtp = "/customer/profile/mobile/verify";

//profile change email verification
const String generateEmailOtp = "/customer/profile/email";
const String verifyProfileEmailOtp = "/customer/profile/email/verify";

//favourites
const String getFavouritesList = "/customer/favourite/list";

//System Config
const String getTargetBonusConf = "/customer/system-config/target-bonus";

//Coin Ledger
const String getTotalReferralEarnings =
    "/customer/coin-ledger/total-referral-earnings";
const String getReferralTracker = "/customer/coin-ledger/referral-tracker";
const String getStoreProductData ="/store-user/store/products/list";