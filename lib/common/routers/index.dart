library routers;

// Package imports:
import 'package:get/route_manager.dart';
import 'package:sola/pages/all_images/all_images_view.dart';
import 'package:sola/pages/chat_modular/call_page/call_page_view.dart';

// Project imports:
import 'package:sola/pages/chat_modular/chat_detail/chat_detail_view.dart';
import 'package:sola/pages/chat_modular/chat_set/chat_set_view.dart';
import 'package:sola/pages/chat_modular/create_group/create_group_controller.dart';
import 'package:sola/pages/chat_modular/create_group/create_group_view.dart';
import 'package:sola/pages/chat_modular/forward_to/forward_to_view.dart';
import 'package:sola/pages/chat_modular/select_members/select_members_view.dart';
import 'package:sola/pages/contact_modular/add_contact/add_contact_view.dart';
import 'package:sola/pages/contact_modular/contact_group/contact_group_view.dart';
import 'package:sola/pages/contact_modular/contact_group_set/contact_group_set_view.dart';
import 'package:sola/pages/contact_modular/contact_info/contact_info_view.dart';
import 'package:sola/pages/contact_modular/group_admin/group_admin_view.dart';
import 'package:sola/pages/contact_modular/group_notification/group_notification_view.dart';
import 'package:sola/pages/contact_modular/manager_group/manager_group_view.dart';
import 'package:sola/pages/contact_modular/member_info/member_info_view.dart';
import 'package:sola/pages/contact_modular/new_contact/new_contact_view.dart';
import 'package:sola/pages/crop_image/crop_image_view.dart';
import 'package:sola/pages/index.dart';
import 'package:sola/pages/index_page/index_page_view.dart';
import 'package:sola/pages/mine_modular/about_us/about_us_view.dart';
import 'package:sola/pages/mine_modular/change_password/change_password_view.dart';
import 'package:sola/pages/mine_modular/my_qrcode/my_qrcode_view.dart';
import 'package:sola/pages/mine_modular/personal_info/personal_info_view.dart';
import 'package:sola/pages/mine_modular/settings/settings_view.dart';
import 'package:sola/pages/mine_modular/version_info/version_info_view.dart';
import 'package:sola/pages/org_modular/org_confirm_order/org_confirm_order_view.dart';
import 'package:sola/pages/org_modular/org_create/org_create_view.dart';
import 'package:sola/pages/org_modular/org_detail/org_detail_view.dart';
import 'package:sola/pages/org_modular/org_manager/org_manager_view.dart';
import 'package:sola/pages/org_modular/org_order_detail/org_order_detail_view.dart';
import 'package:sola/pages/org_modular/org_set_info/org_set_info_view.dart';
import 'package:sola/pages/privacy_and_terms/privacy_and_terms_view.dart';
import 'package:sola/pages/scan_qr/scan_qr_view.dart';
import 'package:sola/pages/search/search_view.dart';
import 'package:sola/pages/splash/splash_view.dart';
import 'package:sola/pages/user_modular/enter_email/enter_email_view.dart';
import 'package:sola/pages/user_modular/forgot_password/forgot_password_view.dart';
import 'package:sola/pages/user_modular/login/login_view.dart';
import 'package:sola/pages/user_modular/register/register_view.dart';
import 'package:sola/pages/user_modular/register_success/register_success_view.dart';
import 'package:sola/pages/user_modular/reset_password/reset_password_view.dart';
import 'package:sola/pages/user_modular/set_login_info/set_login_info_view.dart';
import 'package:sola/pages/user_modular/set_personal_info/set_personal_info_view.dart';
import 'package:sola/pages/user_modular/verify_email/verify_email_view.dart';
import '../../pages/unknown_page.dart';

// export './xxxx.dart';

class Routers {
  static String chatRoute = "/chat";
  static String mineRoute = "/mine";
  static String contactsRoute = "/contacts";
  static const unknownRoute = "/404";
  static String loginRoute = '/login';
  static String forgotPasswordRoute = '/forgotPsw';
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
  static String selectMembersRoute = '/selectMembers';
  static String chatDetailRoute = '/chatDetail';
  static String newContactRoute = '/newContact';
  static String orgOrderDetailRoute = '/orgOrderDetail';
  static String contactGroupSetRoute = '/contactGroupSet';
  static String memberInfoRoute = '/memberInfo';
  static String contactInfoRoute = '/contactInfo';
  static String manageGroupRoute = '/manageGroup';
  static String groupAdminRoute = '/groupAdmin';
  static String groupNotificationRoute = '/groupNotification';
  static String registerSetLoginInfoRoute = '/registerSetLoginInfo';
  static String chatSetRoute = '/chatSet';
  static String settingsRoute = '/settings';
  static String addContactRoute = '/addContact';
  static String forwardToRoute = '/forwardTo';
  static String allImageRoute = '/allImage';
  static String callPageRoute = '/call';
  static String orgSetInfoRoute = '/orgSetInfo';
  static String cropImageRoute = '/cropImage';
  static String scanQrCodeRoute = '/scanQrCode';
  static String searchRoute = '/search';
  static String privacyRoute = '/privacy';

  static final unknownPage =
      GetPage(name: unknownRoute, page: () => const UnknownPage());

  static List<GetPage> routes = <GetPage>[
    GetPage(name: chatRoute, page: () => const ChatPage()),
    GetPage(name: mineRoute, page: () => const MinePage()),
    GetPage(name: contactsRoute, page: () => const ContactsPage()),
    GetPage(name: loginRoute, page: () => const LoginPage()),
    GetPage(name: forgotPasswordRoute, page: () => const ForgotPasswordPage()),
    GetPage(name: verifyEmailRoute, page: () => const VerifyEmailPage()),
    GetPage(name: resetPasswordRoute, page: () => const ResetPasswordPage()),
    GetPage(name: registerRoute, page: () => const RegisterPage()),
    GetPage(name: registerSuccessRoute, page: () => const RegisterSuccessPage()),
    GetPage(name: setPersonalRoute, page: () => const SetPersonalInfoPage()),
    GetPage(name: enterEmailRoute, page: () => const EnterEmailPage()),
    GetPage(name: personalInfoRoute, page: () => const PersonalInfoPage()),
    GetPage(name: myQrcodeRoute, page: () => const MyQrcodePage()),
    GetPage(name: changePasswordRoute, page: () => const ChangePasswordPage()),
    GetPage(name: aboutUsRoute, page: () => const AboutUsPage()),
    GetPage(name: versionInfoRoute, page: () => const VersionInfoPage()),
    GetPage(name: groupRoute, page: () => const ContactGroupPage()),
    GetPage(name: orgDetailRoute, page: () => const OrgDetailPage()),
    GetPage(name: splashRoute, page: () => const SplashPage()),
    GetPage(name: orgManagerRoute, page: () => const OrgManagerPage()),
    GetPage(name: orgCreateRoute, page: () => const OrgCreatePage()),
    GetPage(name: indexRoute, page: () => const IndexPagePage()),
    GetPage(name: orgConfirmOrderRoute, page: () => const OrgConfirmOrderPage()),
    GetPage(name: createGroupRoute, page: () => const CreateGroupPage()),
    GetPage(name: selectMembersRoute, page: () => const SelectMembersPage()),
    GetPage(name: chatDetailRoute, page: () => const ChatDetailPage()),
    GetPage(name: newContactRoute, page: () => const NewContactPage()),
    GetPage(name: orgOrderDetailRoute, page: () => const OrgOrderDetailPage()),
    GetPage(name: contactGroupSetRoute, page: () => const ContactGroupSetPage()),
    GetPage(name: memberInfoRoute, page: () => const MemberInfoPage()),
    GetPage(name: contactInfoRoute, page: () => const ContactInfoPage()),
    GetPage(name: manageGroupRoute, page: () => const ManagerGroupPage()),
    GetPage(name: groupAdminRoute, page: () => const GroupAdminPage()),
    GetPage(name: groupNotificationRoute, page: () => const GroupNotificationPage()),
    GetPage(name: registerSetLoginInfoRoute, page: () => const SetLoginInfoPage()),
    GetPage(name: chatSetRoute, page: () => const ChatSetPage()),
    GetPage(name: settingsRoute, page: () => const SettingsPage()),
    GetPage(name: addContactRoute, page: () => const AddContactPage()),
    GetPage(name: forwardToRoute, page: () => const ForwardToPage()),
    GetPage(name: allImageRoute, page: () => const AllImagesPage()),
    GetPage(name: callPageRoute, page: () => const CallPagePage()),
    GetPage(name: orgSetInfoRoute, page: () => const OrgSetInfoPage()),
    GetPage(name: cropImageRoute, page: () => const CropImagePage()),
    GetPage(name: scanQrCodeRoute, page: () => const ScanQrPage()),
    GetPage(name: searchRoute, page: () => const SearchPage()),
    GetPage(name: privacyRoute, page: () => const PrivacyAndTermsPage()),

  ];
}
