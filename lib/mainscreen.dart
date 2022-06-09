import 'package:dailynewsshorts/Main_News_Screen/topheadlines/topheadlines.dart';
import 'package:dailynewsshorts/apicalls/apicall.dart';
import 'package:dailynewsshorts/data%20models/catogories_data.dart';
import 'package:dailynewsshorts/data%20models/topheadlines.dart';
import 'package:dailynewsshorts/firebase/firebase_readdata.dart';
import 'package:dailynewsshorts/screens/first_screen.dart';
import 'package:dailynewsshorts/widgets/searchbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'color_schems.dart';
import 'data models/categorie_model.dart';

class newsscreen extends StatefulWidget {
  //late String country;
  late String languagecode;
  late String user;
  late String countrycode ;

  newsscreen(
      {required this.languagecode,
      required this.user,
      required this.countrycode});

  @override
  _newsscreenState createState() => _newsscreenState();
}

class _newsscreenState extends State<newsscreen> {
  @override
  final key = GlobalKey<ScaffoldState>();
  List<CategorieModel> catagories = [];
  List<headlinesmodel> lines = [];
  void call() async {
    final call = apicall(languagecode: widget.languagecode);
    var data = await call.datacall();
    await Firebase.initializeApp();
  }

  void topheadlinesdata() async {
    final headlines = await Topheadlines(countrycode: widget.countrycode);
    headlines.toplines();
    lines = headlines.tophealines;
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    call();
    final obj = getCategories();
    obj.forEach((element) {
      CategorieModel data = CategorieModel(
        imageAssetUrl: element.imageAssetUrl,
        categorieName: element.categorieName,
      );

      catagories.add(data);
    });
    topheadlinesdata();
  }

  bottomnavigationbarscreens(int index) {
    switch (index) {
      case 0:
        return Container(
          child: Text("tab1"),
        );
      case 1:
        return SingleChildScrollView(
          child: SizedBox(
            height: 300,
            child: ListView.builder(
                itemCount: lines.length,
                itemBuilder: (context, index) {
                  return topheadlines(
                    imageurl: lines[index].imagurl,
                    author: lines[index].author,
                    title: lines[index].title,
                    description: lines[index].desciption,
                    name: lines[index].name,
                  );
                }),
          ),
        );
    }
  }

  int currentindex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: Container(
        width: 200,
        child: Drawer(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      widget.user,
                      style: TextStyle(fontSize: 30, color: letter),
                    ),
                    IconButton(
                        onPressed: () {
                          final user = FirebaseAuth.instance;
                          user.signOut();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => waitingscreen()));
                        },
                        icon: Icon(Icons.exit_to_app_rounded)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: currentindex,
      //     selectedItemColor: Colors.black,
      //     unselectedItemColor: Colors.black12,
      //     onTap: (value){
      //       setState(() {
      //         currentindex =value;
      //       });
      //     },
      //
      //     items: [
      //
      //   BottomNavigationBarItem(
      //     label: "selected",
      //     icon: IconButton(
      //         onPressed: () {
      //          // print("selected");
      //         },
      //         icon: Icon(Icons.newspaper)),
      //   ),
      //   BottomNavigationBarItem(
      //     label: "TopHeadlines",
      //     icon: IconButton(
      //         onPressed: () {
      //         setState(() {
      //
      //          print(lines[0].desciption);
      //           // topheadlinesdata();
      //         });
      //
      //         },
      //         icon: Icon(Icons.newspaper)),
      //   ),
      // ]),
      appBar: AppBar(
        leading: Row(
          children: [
            InkWell(
              onTap: () {
                key.currentState?.openDrawer();
                print('sidemenu bar');
              },
              child: Icon(
                Icons.view_headline_sharp,
                size: 30,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  widget.user.split(' ').first,
                ),
              ],
            )
          ],
        ),
        leadingWidth: 120,
        backgroundColor: red,
        actions: [
          InkWell(
            onTap: () {
              showSearch(
                  context: context,
                  delegate: searchbar(langcode: widget.languagecode));
              print("search");
            },
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 80,
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.black54,
                      thickness: 10,
                    );
                  },
                  itemCount: catagories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white10, width: 2)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
                                  height: 50,
                                  width: 80,
                                  child: Image(
                                      image: NetworkImage(
                                          catagories[index].imageAssetUrl))),
                              SizedBox(
                                width: 5,
                              ),
                              Text(catagories[index].categorieName),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
              //catagory column
            ),
            Expanded(
              child: Container(

                child: ListView.builder(
                    itemCount: lines.length,
                    itemBuilder: (context, index) {
                      return topheadlines(
                        imageurl: lines[index].imagurl,
                        author: lines[index].author,
                        title: lines[index].title,
                        description: lines[index].desciption,
                        name: lines[index].name,
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
