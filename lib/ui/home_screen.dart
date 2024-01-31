import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/global.dart';

// TODO 2: MAKE HOME SCREEN
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      backgroundColor: Colors.white,
      body: Padding(
        // padding: const EdgeInsets.only(
        //     top: 24,
        //     left: 24

        padding: const EdgeInsets.symmetric(horizontal: 24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Assalamualaikum',
            style: GoogleFonts.poppins(
              color: secondary,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            ),
            Text(
                'Minerva Aditya',
              style: GoogleFonts.poppins(
                color: darkPurple,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.start,
            )
          ],
        ),
      ),
    );
  }


  AppBar _appBar() => AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false, // lose back button
    title: Row(
      children: [
        IconButton(
            onPressed: (() => {}),
            icon: SvgPicture.asset('/svg/ic_menu.svg')
        ),
        Center(

        ),
        Text(
          'Quran App',
          style: GoogleFonts.poppins(
            color: primary,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: (() => {}),
          icon: SvgPicture.asset('/svg/ic_search.svg')),
      ],
    ),
  );

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
    items: [ // func setting behavior
      _bottomNavigationBarItem(icon: '/svg/ic_quran.svg', label: 'Quran'),
      _bottomNavigationBarItem(icon: '/svg/ic_doa.svg', label: 'Doa'),
      _bottomNavigationBarItem(icon: '/svg/ic_bookmark.svg', label: 'Bookmark'),
      ],
  );

  BottomNavigationBarItem _bottomNavigationBarItem({required String icon, required String label, }) =>
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
            icon,
            color: secondary,
        ),
        activeIcon: SvgPicture.asset(
            icon,
            color: primary
        ),
        label: label
      );

}
