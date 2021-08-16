//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final CollectionReference optionCollection = FirebaseFirestore.instance.collection('admin');

  Future uploadData(
      String feedback, String fullname, String phone,
      double colorPoint, double layoutPoint, double creationPoint,
      double ratingFuncPoint, double switchLangPoint, double inoutFuncPoint,
      String nameEvaluate, String nameImage,) async {

    return await optionCollection.doc().set({
      'fullname': fullname,
      'feedback': feedback,
      'phone': phone,
      'nameEvaluate': nameEvaluate,
      'nameImage': nameImage,
      'score':{
        'colorPoint': colorPoint,
        'layoutPoint': layoutPoint,
        'creationPoint': creationPoint,
        'ratingFuncPoint': ratingFuncPoint,
        'switchLangPoint': switchLangPoint,
        'inoutFuncPoint': inoutFuncPoint
      }
    });
  }
}