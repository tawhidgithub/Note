import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:sqldatabase/Controller/colorController.dart';
import 'package:sqldatabase/Controller/home_controller.dart';
import 'package:sqldatabase/db/db_helper.dart';
import 'package:sqldatabase/model/notes_model.dart';
import 'package:sqldatabase/res/component/homeContainer.dart';
import 'package:sqldatabase/view/add_note.dart';
import 'package:sqldatabase/view_model/homeController.dart';

import 'UpdateScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());
  DBhelper DbHeper = DBhelper();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.fatchData();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color(0xff252525),
        title: const Text(
          "Notes",
          style: TextStyle(color: Colors.white, fontSize: 45),
        ),
        actions: [
          InkWell(
            splashColor: Colors.grey,
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Ink(
              color: Colors.transparent,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff3B3B3B),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.search_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              showDiologe(context, height, width);
            },
            child: Ink(
              color: Colors.transparent,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff3B3B3B),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Obx(() {
        if (homeController.notesList.isEmpty) {
          return Stack(
            children: [
              Center(
                child: SizedBox(
                  height: height * 0.33,
                  child: Image.asset(
                    "assets/image/background.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          );
        } else {
          if (homeController.notesList.isNotEmpty) {
            return ListView.builder(
              itemCount: homeController.notesList.length,
              itemBuilder: (context, index) {
                NotesModle note = homeController.notesList[index];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Slidable(
                    key: const ValueKey(0),
                    endActionPane: ActionPane(
                      motion: DrawerMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (val) {
                            DbHeper.delete(note.id!.toInt());
                            homeController.fatchData();
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: "Delete",
                          borderRadius: BorderRadius.circular(15),
                        )
                      ],
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Get.to(UpdateNotes(
                            title: note.title.toString(),
                            description: note.description.toString(),
                          ));
                        },
                        child: Container(
                          height: height * 0.15,
                          width: width * 0.9,
                          decoration: BoxDecoration(

                              /// box Color
                              color: note.color,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              note.title.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }
        return Container();
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: InkWell(
          onTap: () {
            Get.to(const AddNotes());
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xff1b1b1b),
                  spreadRadius: 4,
                  blurRadius: 9,
                  offset: Offset(-1, 1),
                ),
              ],
              color: const Color(0xff252525),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

void showDiologe(BuildContext context, height, width) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xff252525),
          ),
          height: height * 0.3,
          width: width * 0.8,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Designed by -",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "ReDesigned by -",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Illustrations -",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Icons -",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Font -",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Made by -",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
