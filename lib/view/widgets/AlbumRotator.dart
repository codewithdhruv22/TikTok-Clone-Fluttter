import 'package:flutter/material.dart';

class AlbumRotator extends StatefulWidget {
   AlbumRotator({Key? key , required this.profilePicUrl}) : super(key: key);
  String profilePicUrl;

  @override
  State<AlbumRotator> createState() => _AlbumRotatorState();
}

class _AlbumRotatorState extends State<AlbumRotator> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this , duration: Duration(seconds: 5));
    controller.forward();
    controller.repeat();
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0 , end: 1.0).animate(controller),
      child: SizedBox(
        width: 70,
        height: 70,
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white
                  ]
                ),
                borderRadius: BorderRadius.circular(35)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child:
                Image(image:
                // NetworkImage(profilePicUrl)
                NetworkImage("https://instagram.fbho4-2.fna.fbcdn.net/v/t51.2885-19/279889249_1691438077873501_3251232527595982800_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fbho4-2.fna.fbcdn.net&_nc_cat=101&_nc_ohc=hlHNLuY3eQsAX-ssLCW&tn=8zgYjzzt8FVi4fsJ&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT99z0Q3VA_rRP3kZfuNGJu7RwDqtpWdvI14uVG7TS7TIQ&oe=62D67E15&_nc_sid=8fd12b"),
                  fit: BoxFit.cover
                  
                  ,),
              ),

            )
          ],
        ),
      ),
    );
  }
}
