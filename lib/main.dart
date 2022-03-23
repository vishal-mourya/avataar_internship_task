import 'package:avataar_internship_project/pages/profile.dart';
import 'package:avataar_internship_project/providers/profile_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileData()),
      ],
      child: ProfileApp(),
    ),
  );
}
