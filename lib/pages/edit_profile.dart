import 'package:avataar_internship_project/providers/profile_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  String name = "Johnathan";
  String email = "mymail@email.com";
  String contact_number = "+91 9982738484";
  String country = "India";
  String city = "Mumbai";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Edit info",
            style: TextStyle(
              color: Color(0XFF626262),
              fontSize: 16.0,
            ),
          ),
        ),
        backgroundColor: Color(0XFFFFFCEF),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0XFF282828),
            size: 22.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 132,
                  height: 148,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 10),
                      )
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/img1.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0XFF630BFF),
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 7.0),
                      child: Text(
                        "Upload new photo",
                        style: TextStyle(
                          color: Color(0XFF630BFF),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              color: Color(0XFFFFFCEF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About me",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0XFF264F6C),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  buildTextField("Name", context.watch<ProfileData>().name,
                      false, context),
                  buildTextField("Email", context.watch<ProfileData>().email,
                      false, context),
                  buildTextField(
                      "Contact Number",
                      context.watch<ProfileData>().contact_number,
                      false,
                      context),
                  buildTextField("Country",
                      context.watch<ProfileData>().country, false, context),
                  buildTextField("City", context.watch<ProfileData>().city,
                      false, context),
                  SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: RaisedButton(
                      onPressed: () {
                        context.read<ProfileData>().update_name(name);
                        context.read<ProfileData>().update_email(email);
                        context
                            .read<ProfileData>()
                            .update_contact_number(contact_number);
                        context.read<ProfileData>().update_country(country);
                        context.read<ProfileData>().update_city(city);
                      },
                      color: Color(0XFF7A62F8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 140, vertical: 15.0),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, BuildContext context) {
    TextEditingController value = new TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        onChanged: (new_value) {
          if (labelText == "Name") {
            name = new_value;
          } else if (labelText == "Email") {
            email = new_value;
          } else if (labelText == "Contact Number") {
            contact_number = new_value;
          } else if (labelText == "Country") {
            country = new_value;
          } else if (labelText == "City") {
            city = new_value;
          }
        },
        controller: value,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
