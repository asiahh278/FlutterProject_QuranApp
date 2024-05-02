import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/global.dart';
import 'package:untitled/ui/tabs/hijb_tab.dart';
import 'package:untitled/ui/tabs/page_tab.dart';
import 'package:untitled/ui/tabs/para_tab.dart';
import 'package:untitled/ui/tabs/surah_tab.dart';

// TODO 2: MAKE HOME SCREEN
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 4,
          child: Padding(
            // padding: const EdgeInsets.only(left: 24, top: 24),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                  SliverToBoxAdapter(
                    child: _salam(),
                  ),
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    pinned: true,
                    shape: Border(
                      bottom: BorderSide(
                        width: 2,
                        color: primary.withOpacity(.1),
                      )
                    ),
                    bottom: PreferredSize(
                        preferredSize: Size.fromHeight(0),
                        child: _tab()
                    ),
                  ),

                  // TODO 3: CREATE TAB MENU
                ],
                  body: const TabBarView(
                    children: [
                      SurahTab(),
                      ParaTab(),
                      PageTab(),
                      HijbTab()
                    ],
                  )
              ),
          ),
        ),
      );
  }

  TabBar _tab() => TabBar(tabs: [
    _tabItem(label: 'Surah'),
    _tabItem(label: 'Para'),
    _tabItem(label: 'Page'),
    _tabItem(label: 'Hijb'),
  ],
    indicator: UnderlineTabIndicator(
    borderSide:
      BorderSide(
        width: 4,
        color: primary
      ),
      insets: const EdgeInsets.symmetric(horizontal: 60)
    ),
  );

  Tab _tabItem({required String label}) {
    return Tab(
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
  );
  }


  Column _salam() {
    return Column(
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
          ),
          const SizedBox(
            height: 24,
          ),
          _lastRead()
        ],
      );
  }

  Stack _lastRead() {
    return Stack(
          children: [
            Container(
            height: 131,
                // padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFDF98FA),
                  Color(0xFF9055FF)
                ])),
          ),
            Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset('/svg/img_banner_quran.svg')
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                      ),
                      SvgPicture.asset('/svg/ic_lastRead.svg'),
                      Text(
                        'Last Read',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    'Al-Fatihah',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    'Ayat No: 1',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  )

                ],
              ),
            )
          ],

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
