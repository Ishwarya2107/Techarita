import 'dart:async';
import 'package:flutter/material.dart';
import 'package:techerita/mitnews.dart';
import 'package:techerita/techcrunch.dart';



class FrontScreen extends StatefulWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  _FrontScreenState createState() => _FrontScreenState();
}



class _FrontScreenState extends State<FrontScreen> {


  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: const Text("Techarita",style: TextStyle(
            color: Colors.white,),),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to the second screen on container click
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TechCrunch()),
                );
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      //                    <-- BoxDecoration
                      border: Border(bottom: BorderSide()),

                    ),
                    child: ListTile(

                      title: Text('TechCrunch',style: TextStyle(
                        fontSize: 20,

                      ),),
                      subtitle: Text('Tech related blogs'),
                      leading: Container(

                        width: 80,
                        height: 80,
                        child: Image.network('https://i.kym-cdn.com/entries/icons/original/000/020/474/EtxjSSKk_400x400.jpg'),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to the second screen on container click
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MitNews()),
                );
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      //                    <-- BoxDecoration
                      border: Border(bottom: BorderSide()),

                    ),
                    child: ListTile(

                      title: Text('MIT AI',style: TextStyle(
                        fontSize: 20,

                      ),),
                      subtitle: Text('MIT on AI'),
                      leading: Container(

                        width: 80,
                        height: 80,
                        child: Image.network('https://pbs.twimg.com/profile_images/1072880528712495106/ahuQUlOb_400x400.jpg'),
                      ),
                    ),
                  ),

                ],
              ),
            )
          ],
        )

      );

  }
}



