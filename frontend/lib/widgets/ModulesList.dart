import 'package:flutter/material.dart';
import 'package:frontend/models/Courses.dart';
import 'package:frontend/models/Modules.dart';
import 'package:frontend/shared/theme.dart';
import 'package:frontend/widgets/detailwidgetmodule.dart';
import 'detailwidget.dart';

class ModulesList extends StatelessWidget {
  final List<Modules> modules;
  const ModulesList({super.key, required this.modules});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: modules == null ? 0 : modules.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailWidgetModule(modules: modules[index],),
                      // DetailWidget(courses: courses[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    modules[index].name ?? '',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    modules[index].description ?? '',
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
                        modules[index].date ?? '',
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