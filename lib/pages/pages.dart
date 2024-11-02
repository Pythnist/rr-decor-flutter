




import 'package:get/get.dart';
import 'package:rr_decor_flutter/authentication/screen/forget_password_confirm_screen.dart';
import 'package:rr_decor_flutter/authentication/screen/forget_password_screen.dart';
import 'package:rr_decor_flutter/authentication/screen/login_screen.dart';
import 'package:rr_decor_flutter/authentication/screen/register_screen.dart';
import 'package:rr_decor_flutter/authentication/screen/verify_screen.dart';
import 'package:rr_decor_flutter/catalogue/screen/category_screen.dart';
import 'package:rr_decor_flutter/catalogue/screen/discontinue_list_screen.dart';
import 'package:rr_decor_flutter/catalogue/screen/product_screen.dart';
import 'package:rr_decor_flutter/catalogue/screen/product_search_screen.dart';
import 'package:rr_decor_flutter/catalogue/screen/sub_category_screen.dart';
import 'package:rr_decor_flutter/checkout/screen/checkout_screen.dart';
import 'package:rr_decor_flutter/checkout/screen/checkout_success_screen.dart';
import 'package:rr_decor_flutter/checkout/screen/create_address_screen.dart';
import 'package:rr_decor_flutter/checkout/screen/ledget_screen.dart';
import 'package:rr_decor_flutter/checkout/screen/order_history_screen.dart';
import 'package:rr_decor_flutter/contact/screen/contact_screen.dart';
import 'package:rr_decor_flutter/dashboard/screen/dashboard_screen.dart';
import 'package:rr_decor_flutter/middleware/auth_middleware.dart';
import 'package:rr_decor_flutter/middleware/guest_middleware.dart';
import 'package:rr_decor_flutter/model/product_model.dart';
import 'package:rr_decor_flutter/settings/screen/setting_screen.dart';
import 'package:rr_decor_flutter/splash/screen/splash_screen.dart';
import 'package:rr_decor_flutter/utility/bike_web.dart';

import '../catalogue/screen/product_detail_screen.dart';




part './routes.dart';


abstract class AppPages {

  static final pages = [
    GetPage(name: Routes.splashUrl, page:() => SplashScreen()),
    GetPage(name: Routes.loginUrl, page:() => LoginScreen(),transition: Transition.downToUp),
    GetPage(name: Routes.dashboardScreen, page:() => DashboardScreen(),middlewares: [GuestAuthMiddleware()],transition: Transition.downToUp),
    GetPage(name: Routes.categoryUrl, page:() => CategoryScreen(),middlewares: [GuestAuthMiddleware()]),
    GetPage(name: Routes.subCategoryUrl, page:() => SubCategoryScreen(),middlewares: [GuestAuthMiddleware()]),
    GetPage(name: Routes.productUrl, page:() => ProductScreen(),middlewares: [GuestAuthMiddleware()]),
    GetPage(name: Routes.productDetailUrl, page:() => ProductDetailScreen(),middlewares: [GuestAuthMiddleware()]),
    GetPage(name: Routes.discontinuedUrl, page:() => DiscontinueListScreen(),middlewares: [GuestAuthMiddleware()]),
    GetPage(name: Routes.checkoutUrl, page:() => CheckoutScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.checkoutSuccessUrl, page:() => CheckoutSuccessScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.addAddress, page:() => CreateAddressScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.orderHistory, page:() => OrderHistoryScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.ledgerScreen, page:() => LedgetScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.productSearchScreen, page:() => ProductSearchScreen(),middlewares: [GuestAuthMiddleware()]),
    GetPage(name: Routes.contactUsScreen, page:() => ContactScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.settingScreen, page:() => SettingScreen(),middlewares: [AuthMiddleware()]),
    GetPage(name: Routes.verifyScreen, page:() => VerifyScreen(),middlewares: []),
    GetPage(name: Routes.registerScreen, page:() => RegisterScreen(),middlewares: []),
    GetPage(name: Routes.RrdecorwebView, page:() => RRDecorWeb(),middlewares: []),
    GetPage(name: Routes.forgetPassword, page:() => ForgetPasswordScreen(),middlewares: []),
    GetPage(name: Routes.forgetPasswordConfirm, page:() => ForgetPasswordConfirmScreen(),middlewares: []),
  ];

}

