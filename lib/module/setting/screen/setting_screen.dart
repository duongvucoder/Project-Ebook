import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:project_ebook/effect/transition/scale_route.dart';
import 'package:project_ebook/module/login/screens/login_screen.dart';
import 'package:project_ebook/module/setting/account_page.dart';
import 'package:project_ebook/module/setting/header_page.dart';
import 'package:project_ebook/module/setting/notification_page.dart';
import 'package:project_ebook/module/setting/widget/icon_widget.dart';
import 'package:project_ebook/module/welcome/screens/welcome_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Cài đặt',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const HearderPage(),
              SettingsGroup(
                title: 'Cài đặt chung',
                children: [
                  const SizedBox(height: 8),
                  const AccountPage(),
                  const NotificationsPage(),
                  buildLogout(),
                  buildDeleteAccount(),
                ],
              ),
              const SizedBox(height: 16),
              SettingsGroup(title: 'Phản hồi', children: [
                const SizedBox(height: 8),
                const SizedBox(height: 8),
                buildReportBug(context),
                buildSendFeedBack(context),
              ])
            ],
          ),
        ));
  }

  Widget buildLogout() {
    return SimpleSettingsTile(
      title: 'Đăng xuất',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.logout,
        color: Colors.blueAccent,
      ),
      onTap: () {
        Navigator.of(context).push(
          ScaleRoute(
            page: const LoginScreen(),
          ),
        );
      },
    );
  }

  Widget buildDeleteAccount() {
    return SimpleSettingsTile(
      title: 'Xoá tài khoản',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.logout,
        color: Colors.pink,
      ),
      onTap: () {
        Navigator.of(context).push(
          ScaleRoute(
            page: const WellcomeScreen(),
          ),
        );
      },
    );
  }

  Widget buildReportBug(BuildContext context) {
    return SimpleSettingsTile(
      title: 'Báo cáo lỗi',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.bug_report,
        color: Colors.teal,
      ),
      onTap: () {},
    );
  }

  Widget buildSendFeedBack(BuildContext context) {
    return SimpleSettingsTile(
      title: 'Gửi phản hồi',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.thumb_up,
        color: Colors.purple,
      ),
      onTap: () {},
    );
  }
}
