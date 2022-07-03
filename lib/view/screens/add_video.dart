import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_yt/constants.dart';
import 'package:image_picker/image_picker.dart';
class addVideoScreen extends StatelessWidget {
   addVideoScreen({Key? key}) : super(key: key);
videoPick(ImageSource src) async{
  final video  = await ImagePicker().pickVideo(source: src);
  if(video != null){
    Get.snackbar("Video Selected", video.path);
  }else{
    Get.snackbar("Error In Selecting Video", "Please Choose A Different Video File");
  }
}
   showDialogOpt(BuildContext context){
     return showDialog(context: context, builder: (context)=>
     SimpleDialog(
       children: [
         SimpleDialogOption(
           onPressed: ()=>videoPick(ImageSource.gallery),
           child: Text("Gallery"),
         ),
         SimpleDialogOption(
           onPressed: ()=>videoPick(ImageSource.camera),
           child: Text("Camera"),
         ),
         SimpleDialogOption(
           onPressed: (){
             Navigator.pop(context);
           },
           child: Text("Close"),
         )
       ],
     ));
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showDialogOpt(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor
            ),
            child: Center(
              child: Text("Add Video" , style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
