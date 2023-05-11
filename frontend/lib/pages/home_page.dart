

import 'package:flutter/material.dart';
import 'package:frontend/models/Courses.dart';
import 'package:frontend/pages/mainDrawer.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/shared/theme.dart';

import '../widgets/CoursesList.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final ApiService api = ApiService();
   
   late Future<List<Courses>> courseList;
  @override
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState;

    setState(() {
      courseList = api.getCourses() ;
    });
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      key: _key,
        backgroundColor: backgroundColor,
      drawer:const MainDrawer(),
      appBar: AppBar(
         
       title: Center(child: Text(
          "Cours App",
          style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
        ),
       ),
        elevation: 0.0,

 backgroundColor: orangeColor,
        leading: IconButton(
          icon:const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            _key.currentState?.openDrawer();
          },
        ),

          actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.white
              ),
              onPressed: () {}),
        ],
          
      ),
       body: Column(
        children: [
         Container(
        margin: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello Mohamed',
                      style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                   
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Discover our Cours',
                     style: placeholderTextStyle,
                  
                  ),
                ],
              ),
            ),
            Container(
              height: 48,
              width: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/img_profile.png'),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 16,),
          Container
           (width: 380,
         
            child: 
          TextField(
   // controller: _searchController,
    onChanged: (value) {
      
    },
    decoration: InputDecoration(
      hintText: 'Search',
      prefixIcon: Icon(Icons.search,color: Colors.grey,),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),

    ),

    cursorColor: Colors.grey,
    
  ),
          ),
          SizedBox(height: 19,),
          Expanded(
            child:FutureBuilder(
      future: courseList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CoursesList(courses:snapshot.data!);
        } if(snapshot.hasError) {
          return  Center(child: Text('Some error occurred ${snapshot.error}'));
        }
        return Center(child: CircularProgressIndicator());
      },
    ), 
            ),
        ],
       ),
  );  
  }
}



