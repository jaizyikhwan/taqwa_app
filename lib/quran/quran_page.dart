import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqwa_app/quran/quran_service.dart';

import '../models/surah.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
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
      ),
      body: FutureBuilder<List<Surah>>(
        future: QuranService.fetchSurah(),
        builder: (context, snapshot) {
          final surah = snapshot.data;
          print(surah);
          if (snapshot.connectionState == ConnectionState.waiting) {
            const Center(
              child: CircularProgressIndicator(),
            );

            if (snapshot.hasError) {
              Center(
                child: Text(snapshot.error.toString()),
              );
            }
          }
          return ListView.builder(
            itemCount: surah?.length ?? 0,
            itemBuilder: (context, index) {
              final singleSurah = surah?[index];
              return Card(
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFF1B9C85),
                    child: Text(
                      '${singleSurah?.nomor}',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    '${singleSurah?.namaLatin}',
                    style: GoogleFonts.poppins(),
                  ),
                  subtitle: Text(
                      '${singleSurah?.arti} - ${singleSurah?.jumlahAyat} Ayat.'),
                  trailing: Text(
                    '${singleSurah?.nama}',
                    style: GoogleFonts.amiri(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
