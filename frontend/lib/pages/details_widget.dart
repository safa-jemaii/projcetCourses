
import 'package:flutter/material.dart';

import '../shared/theme.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({Key? key,}) : super(key: key);


  

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        title: const Text(' Inscription Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const SizedBox(height: 10),
        
                    // const SizedBox(height: 6),
                        
                            
      SizedBox(height: 10),
                 const Text(
                   "Informations :",
                   style: TextStyle(
                     fontSize: 23,
                     fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,
                     color:Colors.black,
                   ),
                   textAlign: TextAlign.left,
                 ),
                 SizedBox(height: 15),
  
                Row(
  children: [
                                

     SizedBox(width: 8),


    
  ],
),
     SizedBox(height: 15),                           
    Column(
      children: [
        Row(
          children: [


          ],
        ),
      ],

      ),

      
     SizedBox(height: 15),                           
    Column(
      children: [
        Row(
          children: [


          ],
        ),
      ],

      ),
      
     SizedBox(height: 15),                           
    Column(
      children: [
        Row(
          children: [


          ],
        ),
      ],

      ),
         
     SizedBox(height: 15),                           
    Column(
      children: [
        Row(
          children: [


          ],
        ),
      ],

      ),
               ]
                     ),

                  )

                )
             );


  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure want delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Yes'),
              onPressed: () {
               // api.deleteCase(widget.events.id!);
                //Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
              },
            ),
            ElevatedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}