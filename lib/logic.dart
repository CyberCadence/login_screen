import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_screen/View/auth.dart';

import 'View/homepage.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController phone = TextEditingController();
  TextEditingController otp = TextEditingController();

  var verid = "".obs;

  phoneSignin() async {
    await auth.verifyPhoneNumber(
        phoneNumber: "+91${phone.text.trim()}",
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await auth
              .signInWithCredential(phoneAuthCredential)
              .then((value) => Get.to(() => HomePage()));
        },
        verificationFailed: (FirebaseAuthException error) async {
          print(error.toString());
        },
        codeSent: (verficationId, forceResendingToken) async {
          verid.value = verficationId;

          // PhoneAuthCredential credential = PhoneAuthProvider.credential(
          //     verificationId: verficationId, smsCode: otp.value);
          // await auth
          //     .signInWithCredential(credential)
          //     .then((value) => Get.to(() => HomePage()));
        },
        codeAutoRetrievalTimeout: (val) {});
  }

  verify() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verid.value, smsCode: otp.text.trim());
      await auth
          .signInWithCredential(credential)
          .then((value) => Get.to(() => HomePage()));
    } catch (e) {
      print(e.toString());
    }
  }
}
