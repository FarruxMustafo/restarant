import 'dart:ui';

import 'package:flutter/material.dart';

const color = Color(0xff193B55);

class Meal {
  int id;
  String type;
  String name;
  String imageUrl;
  String time;
  int ingCount;
  int bannerColor;
  int cost;
  Meal(
      {required this.type,
      required this.id,
      required this.name,
      required this.imageUrl,
      required this.time,
      required this.ingCount,
      required this.bannerColor,
      required this.cost});
}

List<Meal> meals = [
  Meal(
    id: 1,
    type: "Kavkazsky",
    name: "Shashlik",
    imageUrl: "assets/males/male1.png",
    time: "18 min",
    ingCount: 5,
    bannerColor: 0xffF2DFE1,
    cost: 90400,
  ),
  Meal(
    type: "Kavkazsky",
    id: 2,
    name: "Shashlik",
    imageUrl: "assets/males/male2.png",
    time: "18 min",
    ingCount: 2,
    bannerColor: 0xffDCC7B1,
    cost: 90400,
  ),
  Meal(
    type: "Kavkazsky",
    id: 3,
    name: "Shashlik",
    imageUrl: "assets/males/male3.png",
    time: "18 min",
    ingCount: 3,
    bannerColor: 0xffFFC5A8,
    cost: 90400,
  ),
  Meal(
    type: "Kavkazsky",
    id: 4,
    name: "Shashlik",
    imageUrl: "assets/males/male4.png",
    time: "18 min",
    ingCount: 7,
    bannerColor: 0xff71C3A1,
    cost: 90400,
  ),
  Meal(
    type: "Kavkazsky",
    id: 5,
    name: "Shashlik",
    imageUrl: "assets/males/mlae5.png",
    time: "18 min",
    ingCount: 5,
    bannerColor: 0xffA8B6FF,
    cost: 90400,
  ),
  Meal(
    id: 5,
    type: "Kavkazsky",
    name: "Shashlik",
    imageUrl: "assets/males/male6.png",
    time: "18 min",
    ingCount: 6,
    bannerColor: 0xffFFE7A8,
    cost: 90400,
  ),
  Meal(
    id: 7,
    type: "Kavkazsky",
    name: "Shashlik",
    imageUrl: "assets/males/male7.png",
    time: "18 min",
    ingCount: 7,
    bannerColor: 0xffCEA8FF,
    cost: 90400,
  ),
];
