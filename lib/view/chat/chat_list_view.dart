import 'package:flutter/material.dart';
import 'package:project_asli/widgets/bottom_nav.dart';
import 'chat_detail_view.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  final List<Map<String, String>> chats = const [
    {'name': 'Polisi', 'lastMessage': 'Ada yang bisa kami bantu?'},
    {'name': 'Pemadam Kebakaran', 'lastMessage': 'Kami segera datang.'},
    {'name': 'Ambulans', 'lastMessage': 'Silakan tunggu sebentar.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Chat'),
        backgroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: chats.length,
        separatorBuilder: (_, __) => SizedBox(height: 12),
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            tileColor: Color(0xFFF1E9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.black),
            ),
            leading: CircleAvatar(child: Icon(Icons.person_4)),
            title: Text(chat['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(chat['lastMessage']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatDetailView(chatName: chat['name']!),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNav(page:1),
    );
  }
}
