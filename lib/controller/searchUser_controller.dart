import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_yt/model/user.dart' ;
import 'package:get/get.dart';

class SearchController extends GetxController{
  final Rx<List<myUser>> _searchUsers = Rx<List<myUser>>([]);
  
  List<myUser> get searchedUsers => _searchUsers.value;
  
  searchUser(String query) async{
    _searchUsers.bindStream(
      FirebaseFirestore.instance.collection("users").where("name" , isGreaterThanOrEqualTo: query).snapshots().map((QuerySnapshot queryRes){
        List<myUser> retVal = [];
        for(var element in queryRes.docs ){
          retVal.add(myUser.fromSnap(element));
        }
        return retVal;

      })
    );
  }
}