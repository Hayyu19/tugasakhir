import 'package:flutter/material.dart';
import 'package:project_asli/widgets/bottom_nav.dart' show BottomNav;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'SIAGAKU',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildImage('assets/pemadam2.jpg', 300, 16),
                    _buildImage('assets/pemadam1.jpg', 228, 0),
                    _buildImage('assets/pemadam2.jpg', 300, 0),
                    _buildImage('assets/pemadam1.jpg', 228, 0),
                  ],
                ),
              ),

              SizedBox(height: 26),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Berita Terkini",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: 15),

                    _buildNewsCard('assets/rumah.jpg', 'DAMKAR SEMPROT RUMAH'),
                    _buildNewsCard(
                      'assets/dihajar.jpg',
                      'GAGAL MALING AYAM SEKARUNG,\nMALAH DIHAJAR WARGA',
                    ),
                    _buildNewsCard(
                      'assets/ambulance1.jpg',
                      'NEKAT! ODGJ BAWA KABUR\nAMBULANS DESA',
                    ),
                    _buildNewsCard(
                      'assets/kebakaran.jpg',
                      'KEBAKARAN HUTAN!\nAPA PENYEBABNYA?',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(page: 0),
    );
  }

  Widget _buildImage(String asset, double width, double? lmargin) {
    return Padding(
      padding: EdgeInsets.only(right: 16, left: lmargin!),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(asset, width: width),
      ),
    );
  }

  Widget _buildNewsCard(String image, String title) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.85)],
                ),
              ),
            ),

            Positioned(
              bottom: 10,
              left: 11,
              right: 11,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
