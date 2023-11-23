// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfileModel {
  String name;
  IconData icon;
  ProfileModel({
    required this.name,
    required this.icon,
  });
}

List<ProfileModel> profileCards = [
  ProfileModel(name: 'My Account', icon: IconlyLight.profile),
  ProfileModel(name: 'My Orders', icon: IconlyLight.bag),
  ProfileModel(name: 'Language Settings', icon: IconlyLight.location),
  ProfileModel(name: 'Shipping Address', icon: IconlyLight.location),
  ProfileModel(name: 'My Cards', icon: Icons.card_travel),
  ProfileModel(name: 'Settings', icon: IconlyLight.setting),
  ProfileModel(name: 'Privacy Policy', icon: Icons.policy),
  ProfileModel(name: 'FAQ', icon: Icons.question_answer),
];
