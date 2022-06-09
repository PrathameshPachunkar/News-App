import 'package:dailynewsshorts/Main_News_Screen/searchscreen.dart';
import 'package:dailynewsshorts/apicalls/apicall.dart';
import 'package:dailynewsshorts/data%20models/topheadlines.dart';
import 'package:flutter/material.dart';


class searchbar extends SearchDelegate{
  @override
  late String langcode;


  searchbar({required this.langcode, });

  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        if(query.isEmpty){
          close(context, null );
        }
        else{
          query = "";
        }
      }, icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){
      close(context, null);

    }, icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<headlinesmodel>searchresults = [];
    // TODO: implement buildResults
    final search = searchcall(langcode: langcode,searchparam: query);
    search.Searchcall();
    searchresults = search.Searchresults;
    print(search.Searchresults);
   // print(query);
    return Container(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
   return Container();
  }
}

