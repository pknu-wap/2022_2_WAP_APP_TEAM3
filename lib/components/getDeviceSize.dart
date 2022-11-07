
import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}
double getScreenHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}
double getDrawerWidth(BuildContext context){
  return getScreenWidth(context)*0.6;
}
double getDrawerHeight(BuildContext context){
  return getScreenHeight(context)*0.6;
}