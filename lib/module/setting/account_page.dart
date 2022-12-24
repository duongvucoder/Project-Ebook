import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:project_ebook/module/setting/widget/icon_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  static const keyPassWord = 'keyPassword';
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: 'Cài đặt tài khoản',
      subtitle: 'Riêng tư, Bảo mật, Ngôn ngữ',
      leading: const IconWidget(
        icon: Icons.person,
        color: Colors.green,
      ),
      child: SettingsScreen(
        title: "Cài đặt tài khoản",
        children: [
          buildPrivacy(context),
          buildSecurity(context),
          buildAccountInfor(context),
        ],
      ),
    );
  }

  Widget buildPrivacy(BuildContext context) {
    return SimpleSettingsTile(
      title: 'Riêng tư',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.lock,
        color: Colors.blue,
      ),
      onTap: () {},
    );
  }

  Widget buildSecurity(BuildContext context) {
    return SimpleSettingsTile(
      title: 'Bảo mật',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.security,
        color: Colors.red,
      ),
      onTap: () {},
    );
  }

  Widget buildAccountInfor(BuildContext context) {
    return SimpleSettingsTile(
      title: 'Ngôn Ngữ',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.text_snippet,
        color: Colors.purple,
      ),
      onTap: () {},
    );
  }
}
