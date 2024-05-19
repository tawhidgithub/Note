import 'package:get/get.dart';
import 'package:sqldatabase/db/db_helper.dart';
import 'package:sqldatabase/model/notes_model.dart';

class HomeController extends GetxController {
  RxList<NotesModle> notesList=<NotesModle>[].obs;



  void fatchData() async{
   try{
     List <NotesModle>Data= await DBhelper().getData();
     return notesList.assignAll(Data);
   }
   catch(e){
     print("Fatch Error is $e");
   }


  }
}




































