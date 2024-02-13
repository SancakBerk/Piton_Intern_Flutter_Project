import 'package:flutter/material.dart';
import 'package:piton_intern_project/data/podkes.dart';
import 'package:piton_intern_project/data/renkler.dart';
import 'dart:math' as math;

class nowPlaying extends StatefulWidget {
  Podkes podkes;

  nowPlaying({required this.podkes});

  @override
  State<nowPlaying> createState() => _nowPlayingState();
}

class _nowPlayingState extends State<nowPlaying> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new),color: Colors.white,),
          title: Text(
            "Now Playing",
            style: TextStyle(color: Colors.white,fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: anasayfabackgroundrenk),
      body: Container(
        decoration: BoxDecoration(color: anasayfabackgroundrenk),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                  ),
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.sizeOf(context).width * 1,
                  height: 250,
                  child: Image.asset(
                    "images/explore_page/${widget.podkes.podkesImageName}",
                    fit: BoxFit.contain,
                    height: 200,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  widget.podkes.podkesName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(widget.podkes.podkesProducer,
                  style: TextStyle(color: Colors.grey.shade600)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  "images/now_playing_page/fooo.png",
                  width: MediaQuery.sizeOf(context).width,
                ),
              ),
              Row(
                children: [
                  Text(
                    "24:32",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,),
                  ),
                  Spacer(),
                  Text("34.00",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/now_playing_page/Skip Back.png"),
                    SizedBox(width: 20,),
                    Container(width: 50,decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Colors.grey.shade500
                    ) ,
                        child: Image.asset("images/now_playing_page/Play.png")),
                    SizedBox(width: 20,),
                    Image.asset("images/now_playing_page/Skip Fwd.png"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
