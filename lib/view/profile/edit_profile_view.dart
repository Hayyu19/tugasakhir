import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? userId;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final user = _auth.currentUser;
    if (user != null) {
      userId = user.uid;
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      final data = userDoc.data();
      if (data != null) {
        nameController.text = data['name'] ?? '';
        cityController.text = data['city'] ?? '';
        emailController.text = data['email'] ?? '';
      }
    }
  }

  Future<void> _saveProfile() async {
    if (userId == null) return;

    if (passwordController.text.isNotEmpty && passwordController.text != confirmPasswordController.text) {
      _showError("Password dan konfirmasi tidak cocok.");
      return;
    }

    try {
      await _firestore.collection('users').doc(userId).update({
        'name': nameController.text,
        'city': cityController.text,
        'email': emailController.text,
      });

      if (passwordController.text.isNotEmpty) {
        await _auth.currentUser?.updatePassword(passwordController.text);
      }

      _showSuccess("Data berhasil disimpan.");
    } catch (e) {
      _showError("Gagal menyimpan: $e");
    }
  }

  void _showSuccess(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Berhasil"),
        content: Text(message),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Gagal"),
        content: Text(message),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              buildInputField(Icons.person, 'Ubah Nama', nameController),
              buildInputField(Icons.location_city, 'Ubah Kota', cityController),
              buildInputField(Icons.email, 'Ubah Email', emailController),
              buildInputField(Icons.lock, 'Ubah Password', passwordController, obscure: true),
              buildInputField(Icons.lock_outline, 'Konfirmasi Password', confirmPasswordController, obscure: true),
              SizedBox(height: 16),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF1E9D9),
                  foregroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: _saveProfile,
                icon: Icon(Icons.save),
                label: Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(
    IconData icon,
    String label,
    TextEditingController controller, {
    bool obscure = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: Colors.brown[100],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: label,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        ),
      ),
    );
  }
}
