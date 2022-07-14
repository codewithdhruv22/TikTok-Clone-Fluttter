import 'package:flutter/material.dart';
class ProfileButton extends StatelessWidget {
   ProfileButton({Key? key , required this.profilePhotoUrl}) : super(key: key);
String profilePhotoUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(
        children: [
          Positioned(
            left: 5,
              child: Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),

            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image(
                // image: NetworkImage(profilePhotoUrl),
                image: NetworkImage("https://instagram.fbho4-2.fna.fbcdn.net/v/t51.2885-19/279889249_1691438077873501_3251232527595982800_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fbho4-2.fna.fbcdn.net&_nc_cat=101&_nc_ohc=hlHNLuY3eQsAX-ssLCW&tn=8zgYjzzt8FVi4fsJ&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT99z0Q3VA_rRP3kZfuNGJu7RwDqtpWdvI14uVG7TS7TIQ&oe=62D67E15&_nc_sid=8fd12b"),
                fit: BoxFit.cover,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
