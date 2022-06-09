import 'dart:convert';

import 'package:dailynewsshorts/data%20models/topheadlines.dart';
import 'package:http/http.dart'as http;

import '../Main_News_Screen/topheadlines/topheadlines.dart';

class apicall{
  late String languagecode;
  apicall({required this.languagecode});
  late  String topheadlines = "https://newsapi.org/v2/top-headlines?country=$languagecode&language=ru&apiKey=f2f4dc4c18104f06a26fd04bd8c8b384&pagesize=100";
  datacall()async{
    var response = await http.get(Uri.parse(topheadlines));
    var json = jsonDecode(response.body);
    return json;

  }
}

class searchcall {
  late String langcode;
  late String searchparam;
  //var tempjson = "";
  List<headlinesmodel> Searchresults = [];
  searchcall({required this.langcode, required this.searchparam});

  Searchcall()async{
    var response = await http.get(Uri.parse( "https://newsapi.org/v2/everything?language=$langcode&apiKey=f2f4dc4c18104f06a26fd04bd8c8b384&pagesize=5&q=$searchparam"));
    var json = jsonDecode(response.body);
   // tempjson = json;
    print(json);
    if(response.statusCode == 200){
      json["articles"].forEach((e){
        headlinesmodel data = headlinesmodel(title: e["title"],
            imagurl: e["urlToImage"]??"",
            desciption: e["description"]??"",
            author: e["author"]??"",
            name: e["source"]["name"]??"");
         Searchresults.add(data);
        return data;
      });

    }
return json;
  }
}
class everything{

}


class Topheadlines{
  List <headlinesmodel> tophealines = [];
  List responselist = [];
  late String countrycode;
  Topheadlines({required this.countrycode});
  Future toplines()async{
    var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&language=en&apiKey=f2f4dc4c18104f06a26fd04bd8c8b384"));
    var Data = jsonDecode(response.body);
   // print(Data["articles"]);
    if(response.statusCode == 200){
     Data["articles"].forEach((e)async{
       headlinesmodel apidata = headlinesmodel(
           title: e["title"],
           imagurl: e["urlToImage"]??"",
           desciption: e["description"]??"",
           author: e["author"]??"",
           name: e["source"]["name"]??"");

       tophealines.add(apidata);
       return apidata;
     });
    print(tophealines[0].author);
    }


  }
}