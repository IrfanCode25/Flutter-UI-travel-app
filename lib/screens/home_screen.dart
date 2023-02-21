import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_travelkuy_clone_app/constants/color_constant.dart';
import 'package:flutter_travelkuy_clone_app/constants/style_constant.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '../models/popular_destination_model.dart';
import '../models/travlog_model.dart';
import '../widgets/buttom_navigation_travelkuy.dart';

import '../models/corousel_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // setting appbar
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        title: SvgPicture.asset('assets/svg/travelkuy_logo.svg'),
        elevation: 0,
      ),
      // setting bg
      backgroundColor: mBackgroundColor,
      // setup buttom navigation
      bottomNavigationBar: const BottomNavigationTravelkuy(),
      //body
      body: Container(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            // title section
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 20),
              child: Text(
                'Hi, Ronaldo ✌️ this promos for you!',
                style: mTittleStyle,
              ),
            ),
            // promos section
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carousels.length,
                      // pagination: const SwiperPagination(),
                      // control: const SwiperControl(),
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(carousels[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  // shape paginate
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: map<Widget>(carousels, (index, image) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            height: 6,
                            width: 6,
                            margin: const EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  _current == index ? mBlueColor : mGreyColor,
                            ),
                          );
                        }),
                      ),
                      // more
                      Text(
                        'More...',
                        style: mMoreDiscountStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            // service title section
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10, bottom: 12),
              child: Text(
                'Lets Booking!',
                style: mTittleStyle,
              ),
            ),
            // service
            Container(
              height: 144,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/service_flight_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Flight',
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      'Feel Freedom',
                                      style: mServiceSubtitleStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/service_train_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Trains',
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      'Intercity',
                                      style: mServiceSubtitleStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/service_hotel_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Hotel',
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      'Lets Take a break',
                                      style: mServiceSubtitleStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/svg/service_car_rental_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Car Rental',
                                      style: mServiceTitleStyle,
                                    ),
                                    Text(
                                      'Arround the city',
                                      style: mServiceSubtitleStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // popular destination title
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 20, bottom: 12),
              child: Text(
                'Popular Destination!',
                style: mTittleStyle,
              ),
            ),
            // popular destination
            SizedBox(
              height: 140,
              child: ListView.builder(
                itemCount: populars.length,
                padding: const EdgeInsets.only(left: 16, right: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      height: 140,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: mBorderColor, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              populars[index].image,
                              height: 75,
                            ),
                            Text(
                              populars[index].name,
                              style: mPopularDestinationTitleStyle,
                            ),
                            Text(
                              populars[index].country,
                              style: mPopularDestinationSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // travlog section title
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 20, bottom: 12),
              child: Text(
                'News Update!',
                style: mTittleStyle,
              ),
            ),
            Container(
              height: 181,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 16),
                itemCount: travlogs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 16),
                    width: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 104,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(travlogs[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: SvgPicture.asset(
                                  'assets/svg/travlog_top_corner.svg'),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: SvgPicture.asset(
                                  'assets/svg/travelkuy_logo_white.svg'),
                            ),
                            Positioned(
                              bottom: 0,
                              child: SvgPicture.asset(
                                  'assets/svg/travlog_bottom_gradient.svg'),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Text(
                                'Travlog ${travlogs[index].name}',
                                style: mTravlogTitleStyle,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          travlogs[index].content,
                          maxLines: 3,
                          style: mTravlogContentStyle,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          travlogs[index].place,
                          maxLines: 3,
                          style: mTravlogPlaceStyle,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16, top: 20, bottom: 12),
              child: Text(
                'Travel Blog!',
                style: mTittleStyle,
              ),
            ),
            Container(
              height: 181,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 16),
                itemCount: travlogs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 16),
                    width: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 104,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(travlogs[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: SvgPicture.asset(
                                  'assets/svg/travlog_top_corner.svg'),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: SvgPicture.asset(
                                  'assets/svg/travelkuy_logo_white.svg'),
                            ),
                            Positioned(
                              bottom: 0,
                              child: SvgPicture.asset(
                                  'assets/svg/travlog_bottom_gradient.svg'),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Text(
                                'Travlog ${travlogs[index].name}',
                                style: mTravlogTitleStyle,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          travlogs[index].content,
                          maxLines: 3,
                          style: mTravlogContentStyle,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          travlogs[index].place,
                          maxLines: 3,
                          style: mTravlogPlaceStyle,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: mBlueColor,
              spreadRadius: 2,
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: mBlueColor,
          onPressed: () {},
          child: const Icon(Icons.apple),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
