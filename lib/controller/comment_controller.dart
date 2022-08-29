import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tiktok_yt/model/comment.dart';

class CommentController extends GetxController{
  final Rx<List<Comment>> _comments = Rx<List<Comment>>([]);
  List<Comment> get comments => _comments.value;
  String _postID = "";
  updatePostID(String id){
    _postID = id;
    fetchComment();
  }
  fetchComment() async{
    _comments.bindStream(FirebaseFirestore.instance.collection("videos").doc(_postID).collection("comments").snapshots().map((QuerySnapshot query){
      List<Comment> retVal = [];
      for (var element in query.docs){
        retVal.add(Comment.fromSnap(element));
      }
      return retVal;
    }));
  }
  postComment(String commentText) async{
    try{
    if(commentText.isNotEmpty){

      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid.toString()).get();
      var allDocs = await FirebaseFirestore.instance.collection("videos").doc(_postID).collection("comments").get();
      int len = allDocs.docs.length;

      Comment comment = Comment(
        username : (userDoc.data() as dynamic)['name'],
        comment: commentText.trim(),
        datePub : DateTime.now(),
        likes : [],
        profilePic : (userDoc.data() as dynamic)['profilePic'],
        uid : FirebaseAuth.instance.currentUser!.uid,
        id : 'Comment $len'
      );

      await FirebaseFirestore.instance.collection("videos").doc(_postID).collection("comments").doc('Comment $len').set(comment.toJson());


      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('videos')
.doc(_postID).get();
    await FirebaseFirestore.instance.collection('videos').doc(_postID).update({
      'commentsCount' : (doc.data() as dynamic)['commentsCount'] + 1,
    });
    }else{
      Get.snackbar("Please Enter some content", "Please write something in comment");
    }
    }catch(e){
      Get.snackbar("Error in sending comment", e.toString());
    }
  }
  likeComment(String id) async{
    var uid  = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('videos').doc(_postID).collection("comments").doc(id).get();

    if((doc.data()! as dynamic)['likes'].contains(uid)){
      await FirebaseFirestore.instance.collection('videos').doc(_postID).collection('comments').doc(id).update({
        'likes' : FieldValue.arrayRemove([uid]),
      });
    }else{
      await FirebaseFirestore.instance.collection('videos').doc(_postID).collection('comments').doc(id).update({
        'likes' : FieldValue.arrayUnion([uid]),
      });
    }

  }
}