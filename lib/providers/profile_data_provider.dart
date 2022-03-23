import 'package:flutter/material.dart';

class ProfileData extends ChangeNotifier {
  String _name = "Johnathan";

  String get name => _name;

  void update_name(String new_name) {
    _name = new_name;
    notifyListeners();
  }

  String _email = "mymail@email.com";

  String get email => _email;

  void update_email(String new_email) {
    _email = new_email;
    notifyListeners();
  }

  String _contact_number = "+91 9982738484";

  String get contact_number => _contact_number;

  void update_contact_number(String new_contact_number) {
    _contact_number = new_contact_number;
    notifyListeners();
  }

  String _country = "India";

  String get country => _country;

  void update_country(String new_country) {
    _country = new_country;
    notifyListeners();
  }

  String _city = "Mumbai";

  String get city => _city;

  void update_city(String new_city) {
    _city = new_city;
    notifyListeners();
  }
}
