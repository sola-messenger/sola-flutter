library routers;

import 'package:get/route_manager.dart';
import 'package:sola/pages/chat_modular/create_group/create_group_controller.dart';
import 'package:sola/pages/chat_modular/create_group/create_group_view.dart';
import 'package:sola/pages/contact_modular/contact_group/contact_group_view.dart';
import 'package:sola/pages/index_page/index_page_view.dart';
import 'package:sola/pages/mine_modular/about_us/about_us_view.dart';
import 'package:sola/pages/mine_modular/change_password/change_password_view.dart';
import 'package:sola/pages/mine_modular/my_qrcode/my_qrcode_view.dart';
import 'package:sola/pages/mine_modular/personal_info/personal_info_view.dart';
import 'package:sola/pages/mine_modular/version_info/version_info_view.dart';
import 'package:sola/pages/org_modular/org_confirm_order/org_confirm_order_view.dart';
import 'package:sola/pages/org_modular/org_create/org_create_view.dart';
import 'package:sola/pages/org_modular/org_manager/org_manager_view.dart';
import 'package:sola/pages/splash/splash_view.dart';
import 'package:sola/pages/user_modular/enter_email/enter_email_view.dart';
import 'package:sola/pages/user_modular/forgot_password/forgot_password_view.dart';
import 'package:sola/pages/index.dart';
import 'package:sola/pages/user_modular/login/login_view.dart';
import 'package:sola/pages/org_modular/org_detail/org_detail_view.dart';
import 'package:sola/pages/user_modular/register/register_view.dart';
import 'package:sola/pages/user_modular/register_success/register_success_view.dart';
import 'package:sola/pages/user_modular/reset_password/reset_password_view.dart';
import 'package:sola/pages/user_modular/set_personal_info/set_personal_info_view.dart';
import 'package:sola/pages/user_modular/verify_email/verify_email_view.dart';

import '../../pages/unknown_page.dart';

// export './xxxx.dart';


class Routers{

  static String chatRoute = "/chat";
  static String mineRoute = "/mine";
  static String contactsRoute = "/contacts";
  static const unknownRoute = "/404";
  static String loginRoute = '/login';
  static String forgotPasswordRoute ='/forgotPsw';
  static String verifyEmailRoute = '/verifyEmail';
  static String resetPasswordRoute = '/resetPsw';
  static String registerRoute = '/register';
  static String registerSuccessRoute = '/registerSuccess';
  static String setPersonalRoute = '/setPersonalInfo';
  static String enterEmailRoute = '/enterEmail';
  static String personalInfoRoute = '/personalInfo';
  static String myQrcodeRoute = '/myQrcode';
  static String changePasswordRoute = '/changePsw';
  static String aboutUsRoute = '/aboutUs';
  static String versionInfoRoute = '/versionInfo';
  static String groupRoute = '/group';
  static String orgDetailRoute = '/orgDetail';
  static String splashRoute = '/splash';
  static String orgManagerRoute = '/orgManager';
  static String orgCreateRoute = '/orgCreate';
  static String orgConfirmOrderRoute = '/orgConfirmOrder';
  static String indexRoute = '/index';
  static String createGroupRoute = '/createGroup';


  static final unknownPage =
      GetPage(name: unknownRoute, page: () => const UnknownPage());

  static List<GetPage>  routes= <GetPage>[
    GetPage(name: chatRoute, page: ()=> const ChatPage()),
    GetPage(name: mineRoute, page: ()=> const MinePage()),
    GetPage(name: contactsRoute, page: ()=> const ContactsPage()),
    GetPage(name: loginRoute, page: ()=> const LoginPage()),
    GetPage(name: forgotPasswordRoute, page: ()=> const ForgotPasswordPage()),
    GetPage(name: verifyEmailRoute, page: ()=> const VerifyEmailPage()),
    GetPage(name: resetPasswordRoute, page: ()=> const ResetPasswordPage()),
    GetPage(name: registerRoute, page: ()=> const RegisterPage()),
    GetPage(name: registerSuccessRoute, page: ()=> const RegisterSuccessPage()),
    GetPage(name: setPersonalRoute, page: ()=> const SetPersonalInfoPage()),
    GetPage(name: enterEmailRoute, page: ()=> const EnterEmailPage()),
    GetPage(name: personalInfoRoute, page: ()=> const PersonalInfoPage()),
    GetPage(name: myQrcodeRoute, page: ()=> const MyQrcodePage()),
    GetPage(name: changePasswordRoute, page: ()=> const ChangePasswordPage()),
    GetPage(name: aboutUsRoute, page: ()=> const AboutUsPage()),
    GetPage(name: versionInfoRoute, page: ()=> const VersionInfoPage()),
    GetPage(name: groupRoute, page: ()=> const ContactGroupPage()),
    GetPage(name: orgDetailRoute, page: ()=> const OrgDetailPage()),
    GetPage(name: splashRoute, page: ()=> const SplashPage()),
    GetPage(name: orgManagerRoute, page: ()=> const OrgManagerPage()),
    GetPage(name: orgCreateRoute, page: ()=> const OrgCreatePage()),
    GetPage(name: indexRoute, page: ()=> const IndexPagePage()),
    GetPage(name: orgConfirmOrderRoute, page: ()=> const OrgConfirmOrderPage()),
    GetPage(name: createGroupRoute, page: ()=> const CreateGroupPage()),
  ];
}