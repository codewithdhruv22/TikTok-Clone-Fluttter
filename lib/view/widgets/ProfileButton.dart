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
                image: NetworkImage(profilePhotoUrl),

                fit: BoxFit.cover,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
