import 'package:dailynewsshorts/data%20models/topheadlines.dart';
import 'package:flutter/material.dart';

class searchscreen extends StatefulWidget {
  // late String title;
  // late String imagurl;
  // late String desciption;
  // late String author;
  // late String name;
  late List<headlinesmodel> searchresult ;

  searchscreen(
      { required this.searchresult});

  @override
  _searchscreenState createState() => _searchscreenState();
}

class _searchscreenState extends State<searchscreen> {

  @override
  Widget build(BuildContext context) {
    List<headlinesmodel> results = widget.searchresult;
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context,index){
      return Container(
        child: Text(results[index].author),
      );
    });
  }
}
