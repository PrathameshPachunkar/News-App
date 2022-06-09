import 'package:flutter/material.dart';

class topheadlines extends StatefulWidget {
  late String author;
  late String description;
  late String imageurl;
  late String name;
  late String title;

  topheadlines(
      {required this.author,
      required this.description,
      required this.imageurl,
      required this.name,
      required this.title});
  @override
  _topheadlinesState createState() => _topheadlinesState();
}

class _topheadlinesState extends State<topheadlines> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width,
      child: Column(

        children: [
          Container(

            width: MediaQuery.of(context).size.width / 0.2,
            child: Image(
              image: NetworkImage(widget.imageurl),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Text(widget.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}

// Container(
//
// child: Column(
// children: [
// Container(
// height: 100,
// width: MediaQuery.of(context).size.width/0.2,
// child: Image(image: NetworkImage(widget.imageurl),
// ),
// ),
// SizedBox(
// height: 10,
// ),
// Expanded(
// child: Text(widget.title),
// ),
// ],
// ),
// );
