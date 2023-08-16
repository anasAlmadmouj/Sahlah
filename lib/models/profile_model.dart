import 'package:flutter/cupertino.dart';
import 'package:sahlah/app_layout/app_layout.dart';

class ProfileModel{
  final String name;
  final IconData icon;
  
  ProfileModel({
    required this.name,
    required this.icon,
});
}

List<ProfileModel> profileList = [
  ProfileModel(name: 'Manage Profile', icon: Icons.person,),
  ProfileModel(name: 'Payments', icon: Icons.payment,),
  ProfileModel(name: 'My Location', icon: Icons.location_on_outlined,),
  ProfileModel(name: 'Settings', icon: Icons.settings,),
  ProfileModel(name: 'Language', icon: Icons.language_outlined,),
  ProfileModel(name: 'Support', icon: Icons.contact_support,),
  ProfileModel(name: 'Dark Mode', icon: Icons.light_mode_outlined,),
];