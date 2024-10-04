
import 'package:flutter/material.dart';
import 'Courses.dart';

class TrendingCourse extends StatefulWidget {
 final Function onNavigateToCourses; 

  const TrendingCourse({Key? key, required this.onNavigateToCourses}) : super(key: key);

  @override
  State<TrendingCourse> createState() => _TrendingCourseState();
}



class _TrendingCourseState extends State<TrendingCourse> {
  final List<Map<String, String>> coures = [
    {
      'imageUrl': 'assets/images/course2.jpeg',
      'title': 'Cloud Computing',
      'rating': '1',
    },
    {
      'imageUrl': 'assets/images/course2.jpeg',
      'title': 'Cloud Computing',
      'rating': '3',
    },
    {
      'imageUrl': 'assets/images/course2.jpeg',
      'title': 'Cloud Computing',
      'rating': '2',
    },
    {
      'imageUrl': 'assets/images/course2.jpeg',
      'title': 'Cloud Computing',
      'rating': '1',
    },
    {
      'imageUrl': 'assets/images/course2.jpeg',
      'title': 'Cloud Computing',
      'rating': '2',
    },
  ];
  viewall() {
   widget.onNavigateToCourses();
}

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending Courses',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: viewall,
                child: Text(
                  'View all',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13,
          ),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: [
              for (var course in coures.take(4))
                GestureDetector(
                  onTap: () => viewall(),
                  child: Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: Column(
                    children: [
                      Card(
                          child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(course['imageUrl']!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 10, bottom: 10),
                                  child: Row(
                                    children: List<Widget>.generate(
                                      5,
                                      (index) => Icon(
                                        index <
                                                int.tryParse(
                                                    course['rating'] ?? '0')!
                                            ? Icons.star
                                            : null,
                                        color: Colors.amber,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      course['title'] ?? 'No Title',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('Lessons 1-5',style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey[600]),),
                                        Text(
                                          '1:30 Hours',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey[600]),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          ),
                          SizedBox(height: 20),
                        ],
                      )),
                    ],
                  ),
                ),
                )
            ],
          )
        ]));
  }
}