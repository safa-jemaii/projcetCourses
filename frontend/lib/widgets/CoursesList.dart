import 'package:flutter/material.dart';
import 'package:frontend/models/Courses.dart';
import 'package:frontend/shared/theme.dart';
import 'detailwidget.dart';

class CoursesList extends StatelessWidget {
  final List<Courses> courses;
  const CoursesList({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses == null ? 0 : courses.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailWidget(courses: courses[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courses[index].name ?? '',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    courses[index].description ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade800,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.deepOrange),
                      SizedBox(width: 8),
                      Text(
                        courses[index].date ?? '',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.shade500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.place_outlined, color: Colors.grey.shade600),
                      SizedBox(width: 5),
                      // Expanded(
                      //   child: Text(
                      //     events[index].location ?? '',
                      //     maxLines: 1,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: TextStyle(
                      //       fontSize: 13,
                      //       fontWeight: FontWeight.normal,
                      //       color: Colors.grey.shade500,
                      //       fontStyle: FontStyle.italic,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}