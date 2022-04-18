import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teleheal_assignment/components/utils/AppTheme.dart';
import 'package:teleheal_assignment/components/utils/CustomStyle.dart';
import 'package:teleheal_assignment/components/utils/ScreenSizeHelper.dart';
import 'package:teleheal_assignment/components/widgets/CustomButton.dart';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  int tabIndex = 0;
  bool loading = false;

  void setLoadingState() {
    setState(() {
      loading = !loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppTheme.customAppBar(),
      backgroundColor: AppTheme.primaryWhite,
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rumah Sakit',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontWeight: FontWeight.w500)),
                      ),
                      Text(
                        'Lihat semua',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
                DefaultTabController(
                  length: 4,
                  child: SizedBox(
                    height: 255,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TabBar(
                            physics: ScrollPhysics(),
                            unselectedLabelColor: AppTheme.primaryDarkGrey,
                            unselectedLabelStyle:
                                CustomStyle.unselectLabelStyle(),
                            labelStyle: CustomStyle.selectLabelStyle(),
                            labelColor: AppTheme.primaryDarkGrey,
                            indicator: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: AppTheme.primaryTransparent,
                                border: Border.all(
                                    color: AppTheme.primaryDarkGrey)),
                            onTap: (int index) {
                              setState(() {
                                tabIndex = index;
                              });
                            },
                            isScrollable: true,
                            tabs: [
                              Tab(
                                child: Text('Semua'),
                              ),
                              Tab(
                                child: Text('BPJS'),
                              ),
                              Tab(
                                child: Text('Partner'),
                              ),
                              Tab(
                                child: Text('Terdekat'),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: AppTheme.primaryWhite,
                            child: TabBarView(
                              children: [
                                buildPageBody(0),
                                buildPageBody(1),
                                buildPageBody(2),
                                buildPageBody(3),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: SizedBox(
                    width: ScreenSizeHelper.getDisplayWidth(context),
                    child: CarouselSlider.builder(
                      autoPlay: true,
                      aspectRatio: 3.0,
                      autoPlayInterval: Duration(seconds: 6),
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return loading
                            ? Center(child: CircularProgressIndicator())
                            : Container(
                                width:
                                    ScreenSizeHelper.getDisplayWidth(context),
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage("images/city.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Klinik',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontWeight: FontWeight.w500)),
                      ),
                      Text(
                        'Lihat semua',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
                DefaultTabController(
                  length: 3,
                  child: SizedBox(
                    height: 255,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TabBar(
                            physics: ScrollPhysics(),
                            unselectedLabelColor: AppTheme.primaryDarkGrey,
                            unselectedLabelStyle:
                                CustomStyle.unselectLabelStyle(),
                            labelStyle: CustomStyle.selectLabelStyle(),
                            labelColor: AppTheme.primaryDarkGrey,
                            indicator: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: AppTheme.primaryTransparent,
                                border: Border.all(
                                    color: AppTheme.primaryDarkGrey)),
                            onTap: (int index) {
                              setState(() {
                                tabIndex = index;
                              });
                            },
                            isScrollable: true,
                            tabs: [
                              Tab(
                                child: Text('Semua'),
                              ),
                              Tab(
                                child: Text('BPJS'),
                              ),
                              Tab(
                                child: Text('Partner'),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: AppTheme.primaryWhite,
                            child: TabBarView(
                              children: [
                                buildPageBody(0),
                                buildPageBody(1),
                                buildPageBody(2),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: CustomButton.getBottomNav(context, 0),
    );
  }

  Widget buildPageBody(int tabPosition) {
    if (tabPosition == 0) {
      return Container(
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(15),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.primaryDarkGrey)),
                    child: Icon(EvaIcons.imageOutline),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rumah Sakit Islam Surabaya',
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          'Jl. Achmad Yani No. 2-4, Surabaya',
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w300)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'lihat detail',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(color: Colors.blue)),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    } else if (tabPosition == 1) {
      return Container(
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(15),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.primaryDarkGrey)),
                    child: Icon(EvaIcons.imageOutline),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rumah Sakit Islam Surabaya',
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          'Jl. Achmad Yani No. 2-4, Surabaya',
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w300)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'lihat detail',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(color: Colors.blue)),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    } else if (tabPosition == 2) {
      return Container(
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(15),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.primaryDarkGrey)),
                    child: Icon(EvaIcons.imageOutline),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rumah Sakit Islam Surabaya',
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          'Jl. Achmad Yani No. 2-4, Surabaya',
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w300)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'lihat detail',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(color: Colors.blue)),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    } else {
      return Container(
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(15),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.primaryDarkGrey)),
                    child: Icon(EvaIcons.imageOutline),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rumah Sakit Islam Surabaya',
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          'Jl. Achmad Yani No. 2-4, Surabaya',
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w300)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'lihat detail',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(color: Colors.blue)),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
  }
}
