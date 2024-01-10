import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqwa_app/home/widgets/hero_image.dart';
import 'package:taqwa_app/home/widgets/main_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "TaqwaKu",
          style: GoogleFonts.poppins(
            fontSize: 28.0,
            color: const Color(0xFF1B9C85),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 15, 81, 69),
                Color.fromARGB(255, 69, 185, 164),
              ],
            ),
          ),
          child: const Column(
            children: [
              HeroImage(),
              MainContent(),
            ],
          ),
        ),
      ),
    );
  }
}
