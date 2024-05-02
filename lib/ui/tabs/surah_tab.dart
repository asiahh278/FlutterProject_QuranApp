import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/global.dart';
import 'package:untitled/model/surah.dart';
import 'package:untitled/ui/detail_screen.dart';

// TODO 3.1: IMPLEMENT CONTAINER IN TAB
class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future <List<Surah>> _getSurahList() async { //
    String data = await rootBundle.loadString(
        '/data/list_surah.json'
    );

    return surahFromJson(data);
  }

  // TODO 4.2: DISPLAY THE DATA
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>> (
      future: _getSurahList(),
      initialData: [],
      builder: ((context, snapshot){
    if(!snapshot.hasData) {
    return Container();
    }
    return ListView.separated(
    itemBuilder: (context, index) => _surahItem(context: context, surah: snapshot.data!.elementAt(index)),
    separatorBuilder: (context, index) => Divider(color: const Color(0xFFAAAAAA).withOpacity(0.1)),
    itemCount: snapshot.data!.length);

    })
    );
  }



  // TODO 4.3: DISPLAY THE UI WITH THE DATA
  Widget _surahItem({required BuildContext context, required Surah surah}) => GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(surahNumber: surah.nomor,)));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Stack(
            children: [
              SvgPicture.asset('/svg/ic_nomorsurah.svg'),
              SizedBox(
                width: 36,
                height: 36,
                child:  Center(
                  child: Text(
                    surah.nomor.toString(),
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

            ],
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.namaLatin,
                    style: GoogleFonts.poppins(
                      color: darkPurple,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        surah.tempatTurun.name,
                        style: GoogleFonts.poppins(
                          color: secondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(width: 5),
                      SvgPicture.asset('svg/ic_ellipse.svg'),
                      SizedBox(width: 5),
                      Text(
                        '${surah.jumlahAyat} Ayat',
                        style: GoogleFonts.poppins(
                          color: secondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500

                        ),
                      )

                    ],
                  )
                ],
              )
          ),
          Text(
            surah.nama,
            style: GoogleFonts.amiri(
                color: primary,
                fontWeight: FontWeight.bold,
                fontSize: 20
                ),
              ),
        ],
      ),
    ),

  );
}
