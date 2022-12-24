import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:project_ebook/module/setting/screen/setting_screen.dart';
import 'package:project_ebook/module/setting/widget/icon_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: 'Thông báo',
      subtitle: 'Bản cập nhật ứng dụng',
      leading: IconWidget(
        icon: Icons.notifications,
        color: Colors.redAccent,
      ),
      child: SettingsScreen(
        title: "Thông báo",
        children: [
          buildNews(),
          buildActivity(),
          buildNewsletter(),
          buildAppUpdates(),
        ],
      ),
    );
  }

  Widget buildNews() {
    return SimpleSettingsTile(
      title: 'Thông tin của bạn',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.message,
        color: Colors.blue,
      ),
      onTap: () {},
    );
  }

  Widget buildActivity() {
    return SimpleSettingsTile(
      title: 'Tình trạng hoạt động',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.person,
        color: Colors.orangeAccent,
      ),
      onTap: () {},
    );
  }

  Widget buildNewsletter() {
    return SimpleSettingsTile(
      title: 'Thông tin ứng dụng',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.text_snippet,
        color: Colors.red,
      ),
      onTap: () {},
    );
  }

  Widget buildAppUpdates() {
    return SimpleSettingsTile(
      title: 'Cập nhật phiên bản',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.update,
        color: Colors.cyan,
      ),
      onTap: () {},
    );
  }
}
