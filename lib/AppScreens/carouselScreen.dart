import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';

class carouselSlides extends StatefulWidget {
  const carouselSlides({super.key});

  @override
  State<carouselSlides> createState() => _carouselSlidesState();
}

class _carouselSlidesState extends State<carouselSlides> {
  final List<Map<String, String?>> _imageList = [
    {
      'imageUrl': 'assets/images/course1.jpeg',
      'title': 'Course Title 1',
      'session': 'Live',
    },
    {
      'imageUrl': 'assets/images/course2.jpeg',
      'title': 'Course Title 2',
      'session': 'Live',
    },
    {
      'imageUrl': 'assets/images/course1.jpeg',
      'title': 'Course Title 3',
      'session': 'Live',
    },
  ];

  int _currentIndex = 0;

  // navigateVideo() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => VideoPlayer(uri:)),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: _imageList.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(
                                  _imageList[itemIndex]['imageUrl']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Text overlay
                        GestureDetector(
                          // onTap: () => navigateVideo(),
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _imageList[itemIndex]['title'] ?? '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  _imageList[itemIndex]['session'] ?? '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  options: CarouselOptions(
                    height: 230,
                    autoPlay: true,
                    viewportFraction: 1,
                    autoPlayInterval: const Duration(seconds: 10),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _imageList.map((url) {
                    int index = _imageList.indexOf(url);
                    return Container(
                      width: 50,
                      height: 5.0,
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: _currentIndex == index
                            ? Color.fromRGBO(0, 0, 0, 1)
                            : Color.fromRGBO(8, 8, 38, .3),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ))
      ],
    );
  }
}
