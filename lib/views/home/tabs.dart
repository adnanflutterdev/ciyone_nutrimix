import 'package:ciyone_nutrimix/core/constants/tab_icons.dart';
import 'package:ciyone_nutrimix/views/home/tabs/explore_tab/explore_tab.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/views/habits_tab.dart';
import 'package:ciyone_nutrimix/views/home/tabs/home_tab/home_tab.dart';
import 'package:ciyone_nutrimix/views/home/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> tabs = [
  {'icon': TabIcons.home, 'label': 'Home'},
  {'icon': TabIcons.explore, 'label': 'Explore'},
  {'icon': TabIcons.habits, 'label': 'Habits'},
  {'icon': TabIcons.profile, 'label': 'Profile'},
];

List<Widget> pages = [
  const HomeTab(),
  const ExploreTab(),
  const HabitsTab(),
  const ProfileTab(),
];
