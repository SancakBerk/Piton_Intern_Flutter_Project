import 'package:flutter/material.dart';
import 'package:piton_intern_project/data/renkler.dart';
import 'package:piton_intern_project/ui/views/explore.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: anasayfabackgroundrenk,
        ),
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 50),
            child: Column(
              children: [
                Container(
                    width: 240,
                    height: 317,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                        image: DecorationImage(
                            image: AssetImage("images/anasayfa_page/anasayfa.png"),
                            fit: BoxFit.contain))),
                Text("Podkes"),
                Text(
                    "A podcast is an episodic series of spoken word digital audio files that a user can download to a personal device for easy listening.",
                    style: TextStyle(color: anasayfaTextrenk),
                    textAlign: TextAlign.center),
                Container(
                  height: 100,
                  width: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(color: anasayfabutonrenk),
                      ),
                      Spacer(),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(color: anasayfabutonrenk),
                      ),
                      Spacer(),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(color: anasayfabutonrenk),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 70,
                    height: 70,
                    color: Colors.white,
                    child:
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Explore(),)).then((value) {
                        print("anasayfaya dönüldü");
                      });
                    }, icon: Icon(Icons.arrow_right_alt_sharp,size: 30),color: Colors.black,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
