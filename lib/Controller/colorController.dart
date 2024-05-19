import 'dart:math';

import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import '../data/Colors.dart';

class ColorController extends GetxController{
late int random;

late Color colors;


  getColors(){
     random= Random().nextInt(10);
     colors= ColorS[random];
  }































}