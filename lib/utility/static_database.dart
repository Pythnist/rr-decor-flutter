



import 'package:rr_decor_flutter/pages/pages.dart';

import '../model/common_model.dart';

class StaticDatabase {

  static List<CommonModel>  drawerList = [
    CommonModel(
      id: 1,
      label: "Search Stock",
      routes: Routes.productSearchScreen
    ),
    CommonModel(
        id: 1,
        label: "Order History",
        routes: Routes.orderHistory
    ),
    CommonModel(
        id: 1,
        label: "Discontinues Collections",
        routes: Routes.discontinuedUrl
    ),
    CommonModel(
        id: 1,
        label: "Legder",
        routes: Routes.ledgerScreen
    ),
    CommonModel(
        id: 1,
        label: "Contact",
        routes: Routes.contactUsScreen
    ),
    CommonModel(
        id: 1,
        label: "Setting",
        routes: Routes.settingScreen
    ),

  ];

  static List<CommonModel>  imageLis = [
    CommonModel(
        id: 1,
        icon: "assets/images/EssentialsLogo.png"
    ),
    CommonModel(
        id: 1,
        icon: "assets/images/ArezzoLogo.png"
    ),
    CommonModel(
        id: 1,
        icon: "assets/images/RasayaLogo.png"
    ),
    CommonModel(
        id: 1,
        icon: "assets/images/PersanLogo.png"
    ),
    CommonModel(
        id: 1,
        icon: "assets/images/VersaceLogo.png"
    ),
    CommonModel(
        id: 1,
        icon: "assets/images/Sketch23Logo.png"
    ),

  ];

}
