import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F9F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F9F1),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Back',
          style: TextStyle(fontSize: 18),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profile.png'), 
            ),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingsCard(
            title: 'General Settings',
            items: [
              _buildSettingItem('assets/globe.png', 'Set Language'),
              _buildSettingItem('assets/Bell_pin.png', 'Care Notifications'),
              _buildSettingItem('assets/padlock.png', 'Allow Access'),
            ],
          ),
          const SizedBox(height: 16),
          _buildSettingsCard(
            title: 'Custom Application',
            items: [
              _buildSettingItem('assets/chield_check.png', 'Subscriptions'),
              _buildSettingItem('assets/directions.png', 'Care Change'),
              _buildSettingItem('assets/folder_del.png', 'Clear Cache'),
            ],
          ),
          const SizedBox(height: 16),
          _buildSettingsCard(
            title: 'Support',
            items: [
              _buildSettingItem('assets/thumb_up.png', 'Encourage Us'),
              _buildSettingItem('assets/question.png', 'Help'),
              _buildSettingItem('assets/chat.png', 'Contact Us'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCard({required String title, required List<Widget> items}) {
    return Card(
      color: const Color(0xFFECF5FC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold, 
                color: Color(0xFF09090A)),
            ),
            const SizedBox(height: 12),
            ...items,
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(String iconPath, String text) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              iconPath,
              width: 50,
              height: 50,
              color: const Color(0xFF33363F), // Optional: match icon tint
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 22,
                  color: Color(0xFF1F7696),
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
        const Divider(thickness: 1,
          color: Color(0xFF000000),
        ),
      ],
    );
  }
}
