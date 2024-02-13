import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piton_intern_project/data/podkes.dart';

class ExploreCubit extends Cubit<List<Podkes>>
{
  ExploreCubit():super([]);


  List<Podkes> filterByCategoryAndSearch (List<Podkes> data, String searchBarText,String chooseCategory )
  {
    var mylist = data;
    var myNewFilteredList = mylist.where((element) => element.podkesName.contains(searchBarText)).toList();
    if(chooseCategory !="" && chooseCategory !="All")
    {
      myNewFilteredList = myNewFilteredList.where((element) => element.podkesCategories.contains(chooseCategory)).toList();
      return(myNewFilteredList);
    }
    return(myNewFilteredList);
  }

  Future<List<Podkes>> bringpodcasts() async {
    List<Podkes> list = [];
    var p1 = Podkes(
        podkesName: "The missing 96 percent of the universe",
        podkesProducer: "Claire Malone",
        podkesImageName: "image0.png" ,podkesCategories: ["Life","Comedy"] );

    var p2 = Podkes(
        podkesName: "How Dolly Parton led me to an epiphany",
        podkesProducer: "Abumenyang",
        podkesImageName: "image1.png",podkesCategories: ["Life","Tech"] );

    var p3 = Podkes(
        podkesName: "The missing 96 percent of the universe",
        podkesProducer: "Tir McDohl",
        podkesImageName: "image2.png",podkesCategories: ["Life","Comedy"] );

    var p4 = Podkes(
        podkesName: "Ngobam with Denny Caknan",
        podkesProducer: "Denny Kulon",
        podkesImageName: "image3.png",
        podkesCategories: ["Life","Tech"]
    );
    list.add(p1);
    list.add(p2);
    list.add(p3);
    list.add(p4);

    return list;
  }






}