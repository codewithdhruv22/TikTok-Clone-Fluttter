import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_yt/model/user.dart';
import 'package:tiktok_yt/view/screens/Home.dart';
import 'package:tiktok_yt/view/screens/auth/login_screen.dart';
import 'package:tiktok_yt/view/screens/auth/signup_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
File? proimg;

void pickImage() async{
  print("IMAGE PICKED SUCCESSFULLY");
final image = await ImagePicker().pickImage(source: ImageSource.gallery);
// if(image == null) return;

final img = File(image!.path);
this.proimg = img;

}

//User State Persistence


   late Rx<User?> _user;
  User get user => _user.value!;

// _user  - Nadi
  // _user.bindStream - Nadi Me Color Deko
  //ever - Aap Ho
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialView);

    //Rx - Observable Keyword - Continously Checking Variable Is Changing Or Not.
  }

  _setInitialView(User? user){
    if(user == null){
      Get.offAll(()=> LoginScreen());
    }else{
      Get.offAll(() => HomeScreen());
    }
  }



  //User Register

  void SignUp(
      String username, String email, String password, File? image) async {
    try {
      print("IMAGE HERE");
      print(image.toString() == '');
      print("IMAGE HERE");
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
       String downloadUrl = await _uploadProPic(image);

        myUser user = myUser(name: username, email: email, profilePhoto: downloadUrl, uid: credential.user!.uid);

        await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set(user.toJson());

      }
    } catch (e) {
      print(e);
      Get.snackbar("Error Occurred", e.toString());
    }
  }

  Future<String> _uploadProPic(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('profilePics')
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDwnUrl = await snapshot.ref.getDownloadURL();
    return imageDwnUrl;
  }


  void login(String email, String password) async
  {

    try{
  if(email.isNotEmpty && password.isNotEmpty){
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }else{
    Get.snackbar("Error Logging In", "Please enter all the fields");
  }


    }catch(e){
Get.snackbar("Error Logging In",e.toString());
    }
  }

  signOut(){
    FirebaseAuth.instance.signOut();
    Get.offAll(LoginScreen());
  }
}
