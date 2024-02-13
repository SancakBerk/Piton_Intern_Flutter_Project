import 'package:flutter/material.dart';
import 'package:piton_intern_project/data/cubits/explore_cubits.dart';
import 'package:piton_intern_project/data/renkler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'package:piton_intern_project/ui/views/now_playing.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _MusicsState();
}

class _MusicsState extends State<Explore> {
  var initindex = 0;
  List<String> kategorilist = ["All", "Life", "Comedy", "Tech"];
  String chosenCategory = "";

  var TFController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: anasayfabackgroundrenk,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: anasayfabackgroundrenk,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("images/explore_page/LeftBar.png"),
            Text(
              "PodKes",
              style: TextStyle(color: Colors.white),
            ),
            Image.asset("images/explore_page/Vector.png"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: anasayfabackgroundrenk,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: TFController,
                    onChanged: (value) {
                      setState(() {
                        TFController = TFController;
                      });
                    },
                    style: TextStyle(color: Colors.white),

                    decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.all(8),
                      itemCount: kategorilist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                chosenCategory = kategorilist[index];
                              });
                            },
                            child: Text(
                              kategorilist[index],
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: explorebuttonbackground),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Trending",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
                FutureBuilder(
                  future: context.read<ExploreCubit>().bringpodcasts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var myNewFilteredList = context.read<ExploreCubit>().filterByCategoryAndSearch(snapshot.data!, TFController.text, chosenCategory);
                      return Container(
                        height: 400,
                        child: GridView.builder(
                      itemCount: myNewFilteredList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.5,
                        ),
                        itemBuilder: (context, index) {
                          var eachpodcast = myNewFilteredList[index];
                          if (eachpodcast.podkesName.contains(TFController.text)) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => nowPlaying(podkes: eachpodcast),));
                                },
                                child: Container(
                                  height: 150,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                        ),
                                        alignment: Alignment.bottomCenter,
                                        width: 200,
                                        height: 150,
                                        child: Image.asset(
                                          "images/explore_page/${eachpodcast.podkesImageName}",
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          eachpodcast.podkesName,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        eachpodcast.podkesProducer,
                                        style: TextStyle(color: anasayfaTextrenk),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              child: Center(
                                child: Text(
                                  "Filtrelenme sonucuunu geçemedi",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      );
                    } else {
                      return Text("data yok");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: initindex,
        backgroundColor: explorebuttonbackground,
        items: [
          BottomNavigationBarItem(icon: IconButton(onPressed: () {
            setState(() {
              initindex = 0;
            });
          },
            icon: Icon(Icons.home),
            color: initindex == 0 ? Colors.white : anasayfabutonrenk,),
              label: "Discover"),
          BottomNavigationBarItem(icon: IconButton(onPressed: () {
            setState(() {
              initindex = 1;
            });
          },
              icon: Icon(Icons.book),
              color: initindex == 1 ? Colors.white : anasayfabutonrenk),
              label: "Libary"),
          BottomNavigationBarItem(icon: IconButton(onPressed: () {
            setState(() {
              initindex = 2;
            });
          },
              icon: Icon(Icons.person),
              color: initindex == 2 ? Colors.white : anasayfabutonrenk),
              label: "Profile"),

        ],
      ),
    );
  }
}
