// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '/core/router/routes.dart';

class ProfileModel {
  String name;
  IconData icon;
  String url;

  ProfileModel({
    required this.name,
    required this.icon,
    required this.url,
  });
}

List<ProfileModel> profileCards = [
  ProfileModel(
    url: '',
    name: 'My Account',
    icon: IconlyLight.profile,
  ),
  ProfileModel(
    url: '',
    name: 'My Orders',
    icon: IconlyLight.bag,
  ),
  ProfileModel(
    url: Routes.languageRoute,
    name: 'Language Settings',
    icon: IconlyLight.location,
  ),
  ProfileModel(
    url: Routes.shippingAddressRoute,
    name: 'Shipping Address',
    icon: IconlyLight.location,
  ),
  ProfileModel(
    url: Routes.myCardsRoute,
    name: 'My Cards',
    icon: Icons.card_travel,
  ),
  ProfileModel(
    url: '',
    name: 'Settings',
    icon: IconlyLight.setting,
  ),
  ProfileModel(
    url: '',
    name: 'Privacy Policy',
    icon: Icons.policy,
  ),
  ProfileModel(
    url: '',
    name: 'FAQ',
    icon: Icons.question_answer,
  ),
];
