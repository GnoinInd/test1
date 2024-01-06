import 'package:flutter/material.dart';


ourStyle({family = "regular", double? size = 14, color = Colors.white}){
  return TextStyle(
  fontSize: size,
  fontFamily: family,
    color:color,
  );
}