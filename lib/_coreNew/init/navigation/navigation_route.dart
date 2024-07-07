import 'package:flutter/material.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

/* Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(const LoginPage());
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(const HomeView());
      case NavigationConstants.DASHBOARD_VIEW:
        return normalNavigate( HomeView());
      case NavigationConstants.EN_COK_SATAN_URUNLER_VIEW:
        return normalNavigate(NotFoundNavigationWidget());
      case NavigationConstants.STOK_HAREKET_IZLEME_VIEW:
        return normalNavigate(NotFoundNavigationWidget());
      case NavigationConstants.GIMSA_SATIS_VIEW:
        return normalNavigate(NotFoundNavigationWidget());
      case NavigationConstants.SATIS_VIEW:
        return normalNavigate(NotFoundNavigationWidget());
      case NavigationConstants.SAATLIK_SATIS_DAGILIM_VIEW:
        return normalNavigate(SaatlikSatis());
      case NavigationConstants.KASIER_ACIK_FAZLA_VIEW:
        return normalNavigate(NotFoundNavigationWidget());
      case NavigationConstants.KASIER_PERFORMANS_VIEW:
        return normalNavigate(NotFoundNavigationWidget());
      case NavigationConstants.RAPOR_GRUP_TANIMLARI_VIEW:
        return normalNavigate( NotFoundNavigationWidget());
      case NavigationConstants.DASHBOARD_TANIMLARI_VIEW:
        return normalNavigate(NotFoundNavigationWidget());
      case NavigationConstants.RAPOR_TANIMLARI_VIEW:
        return normalNavigate(NotFoundNavigationWidget());
      case NavigationConstants.RAPOR_TANIMI_EKLE_VIEW:
        return normalNavigate(NotFoundNavigationWidget());
      case NavigationConstants.KULLANICI_EKLE_VIEW:
        return normalNavigate(NotFoundNavigationWidget());
      case NavigationConstants.KULLANICI_LISTESI_VIEW:
        return normalNavigate(NotFoundNavigationWidget());
      case NavigationConstants.ROL_EKLE_VIEW:
        return normalNavigate(NotFoundNavigationWidget());
      case NavigationConstants.ROL_LISTESI_VIEW:
        return normalNavigate(NotFoundNavigationWidget());
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget()
        );
    }
  }*/

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
