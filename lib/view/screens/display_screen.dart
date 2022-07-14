import 'package:flutter/material.dart';
import 'package:tiktok_yt/view/widgets/AlbumRotator.dart';
import 'package:tiktok_yt/view/widgets/ProfileButton.dart';
import 'package:tiktok_yt/view/widgets/TikTokVideoPlayer.dart';


class DisplayVideo_Screen extends StatelessWidget {
  const DisplayVideo_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                TikTokVideoPlayer(
                  videoUrl: "aaa",
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "@DhruvArne",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      Text(
                        "Awesome Caption",
                      ),
                      Text(
                        "Breathing Alive",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 400,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 3, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        ProfileButton(
                          profilePhotoUrl: "ADD",
                        ),

                        Column(
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 45,
                              color: Colors.white,
                            ),
                            Text(
                              "Like",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.reply,
                              size: 45,
                              color: Colors.white,
                            ),
                            Text(
                              "Share",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.comment,
                              size: 45,
                              color: Colors.white,
                            ),
                            Text(
                              "Comments",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            SizedBox(height: 20,),
                            Column(
                              children: [
                                AlbumRotator(profilePicUrl: "ADA")

                              ],
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
