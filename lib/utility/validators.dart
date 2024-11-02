


import 'package:get/get.dart';

class AppValidators {

  static String? phoneNumberValid(String? value){
    if(value!.isBlank!){
      return "Please Enter Phone Number";
    } else if(value.length != 10){
      return "Invalid Phone Number";
    }
    return null;
  }

  static String? noBlankValidatior(String? value){
    if(value!.isBlank!){
      return "Required";
    }
    return null;
  }
  static String? isEmailValidatior(String? value){
    if(value!.isBlank!){
      return "This field is required";
    }else if(GetUtils.isEmail(value) == false){
      return "Invalid Email";
    }
    return null;
  }

  static String? validateConfirmPassword(String? value,String? value2){
    if(value!.isBlank == true){
      return "This field is required";
    }else if(value != value2){
      return "Password not match";
    }
    return null;
  }





}