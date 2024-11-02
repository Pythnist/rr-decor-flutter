



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/utility/utility.dart';


import 'app_constant.dart';

class AppThemeButtonss extends StatelessWidget {

  String? title;
  void Function()? onClick;
  AppThemeButtonss({Key? key,this.title,this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(

            borderRadius: BorderRadius.all(Radius.circular(AppConstant.buttonRadius))
        ),
        child: Center(
          child: Text(title!,textScaleFactor: Get.textScaleFactor,),
        ),
      ),
    );
  }
}


class AppTextButton extends StatelessWidget {

  String? title;
  void Function()? onClick;
  AppTextButton({Key? key,this.title,this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(AppConstant.buttonRadius))
        ),
        child: Center(
          child: Text(title!,textScaleFactor: Get.textScaleFactor,),
        ),
      ),
    );
  }
}

class AppBlueButton extends StatelessWidget {

  String? title;
  void Function()? onClick;
  AppBlueButton({Key? key,this.title,this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
            color: Get.theme.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(AppConstant.buttonRadius))
        ),
        child: Center(
          child: Text(title!,textScaleFactor: Get.textScaleFactor,),
        ),
      ),
    );
  }
}



class DextrousDialog extends StatelessWidget {
  String? title,content;
  void Function()? onClick;
  DextrousDialog({Key? key,this.title,this.content,this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(child: Column(
      children: [Container(
        //height: 120,
        width: Get.width* 0.90,
        margin: const EdgeInsets.only(top: 5.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title!,textScaleFactor: Get.textScaleFactor,textAlign: TextAlign.center,),
            const Divider(),
            Text(content!,textScaleFactor: Get.textScaleFactor,textAlign: TextAlign.center,),
            const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.30),
                        borderRadius: const BorderRadius.all(Radius.circular(5.0))
                    ),
                    child: Center(
                      child: Text("delete".tr,textScaleFactor: Get.textScaleFactor,),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.30),
                        borderRadius: const BorderRadius.all(Radius.circular(5.0))
                    ),
                    child: Center(
                      child: Text("ok".tr,textScaleFactor: Get.textScaleFactor,),
                    ),
                  ),
                )
              ],
            )


          ],
        ),
      )],
    ),);
  }
}


class NoErrorView extends StatelessWidget {
  void Function()? onClick;
  NoErrorView({Key? key,this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // LottieBuilder.asset(
          //   AppConstant.lottieNoError,
          //   height: Get.height * 0.30,
          //   width: Get.width,
          // ),
          Text(
            "noErrorMessage".tr,
            textScaleFactor: Get.textScaleFactor,

            textAlign: TextAlign.center,
          ),
          GestureDetector(
            onTap: onClick,
            behavior: HitTestBehavior.opaque,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              height: 35,
              width: 100,
              decoration:  BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: Center(
                child: Text(
                  "refresh".tr,
                  textScaleFactor: Get.textScaleFactor,

                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EComAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  EComAppBar({Key? key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Text(title!,textScaleFactor: Get.textScaleFactor,),

    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.0);
}


class DextrousProgressBar extends StatelessWidget {
  const DextrousProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Lottie.asset(AppConstant.lottieProgressBar,width: Get.width,height: Get.height * 0.30)
        ],
      ),
    );
  }
}


class ShowNativeDialog extends StatelessWidget {
  final String? title;
  final String? description;
  final void Function()? onClick;
  const ShowNativeDialog({Key? key,this.title,this.description,this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }



}




class DexTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? textEditingController;
  final String? hintText;
  final TextInputType? textInputType;
  final String? Function(String?)? validate;
  final void Function()? onTap;
  final bool? readOnly;
  final dynamic maxLines;
  final bool? showTrailingIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? showLabel;
  final bool? isMandatory;
  final void Function(String? value)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const DexTextField(
      {Key? key,
        this.label,
        this.textEditingController,
        this.hintText,
        this.textInputType,
        this.validate,
        this.onTap,
        this.inputFormatters,
        this.readOnly,
        this.maxLines,
        this.suffixIcon,
        this.showLabel,
        this.obscureText,
        this.isMandatory,
        this.onChanged,
        this.showTrailingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      style: Get.theme.textTheme.headlineSmall,
      decoration: showTrailingIcon!
          ? Utility.vNetInputDecoration(hintText, null, true)
          .copyWith(suffixIcon: suffixIcon)
          : Utility.vNetInputDecoration(hintText, null, true),
      readOnly: readOnly!,
      onTap: onTap,
      controller: textEditingController,
      validator: validate,
      keyboardType: textInputType,
      maxLines: maxLines,
      onChanged: onChanged,
    );
  }
}


class DexTextFieldMode extends StatelessWidget {
  final String? label;
  final TextEditingController? textEditingController;
  final String? hintText;
  final TextInputType? textInputType;
  final String? Function(String?)? validate;
  final void Function()? onTap;
  final bool? readOnly;
  final dynamic maxLines;
  final bool? showTrailingIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? showLabel;
  final bool? isMandatory;
  final bool? showPrefixIcon;
  final Widget? prefixIcon;
  final TextCapitalization? textCapitalization;
  final void Function(String? value)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const DexTextFieldMode(
      {Key? key,
        this.label,
        this.showPrefixIcon,
        this.prefixIcon,
        this.textEditingController,
        this.hintText,
        this.textInputType,
        this.validate,
        this.onTap,
        this.inputFormatters,
        this.readOnly,
        this.maxLines,
        this.suffixIcon,
        this.showLabel,
        this.obscureText,
        this.isMandatory,
        this.onChanged,
        this.textCapitalization,
        this.showTrailingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            child: Utility.fieldLabels(label, isMandatory ?? false),
            visible: showLabel!,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              //color: Colors.white,
              // boxShadow: [
              //   BoxShadow(
              //     color: Styles.primaryColor.withOpacity(0.10),
              //     spreadRadius: 5,
              //     blurRadius: 7,
              //     offset: const Offset(0, 3), // changes position of shadow
              //   ),
              // ],
            ),
            child: TextFormField(
              obscureText: obscureText!,
              style: Get.theme.textTheme.headlineSmall,
              decoration: showTrailingIcon!
                  ? Utility.vNetInputDecoration(hintText, null, false)
                  .copyWith(suffixIcon: showTrailingIcon! ? suffixIcon : Container(),prefixIcon: showPrefixIcon! ? prefixIcon : Container())
                  : Utility.vNetInputDecoration(hintText, null, false),
              readOnly: readOnly!,
              onTap: onTap,
              controller: textEditingController,
              validator: validate,
              textCapitalization: textCapitalization != null  ? TextCapitalization.characters : TextCapitalization.sentences,
              keyboardType: textInputType,
              maxLines: maxLines,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}


class BikeTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? textEditingController;
  final String? hintText;
  final TextInputType? textInputType;
  final String? Function(String?)? validate;
  final void Function()? onTap;
  final bool? readOnly;
  final dynamic maxLines;
  final bool? showTrailingIcon;
  final Widget? suffixIcon;
  final Widget? actionIcon;
  final bool? obscureText;
  final bool? showLabel;
  final bool? isMandatory;
  final String? helperText;
  final int? maxLength;
  final void Function(String? value)? onChanged;
  final bool? isCircular;
  final List<TextInputFormatter>? inputFormatters;

  const BikeTextField(
      {Key? key,
        this.label,
        this.textEditingController,
        this.hintText,
        this.textInputType,
        this.validate,
        this.onTap,
        this.inputFormatters,
        this.readOnly,
        this.maxLines,
        this.suffixIcon,
        this.showLabel,
        this.obscureText,
        this.isMandatory,
        this.onChanged,
        this.actionIcon,
        this.helperText,
        this.maxLength,
        this.isCircular,
        this.showTrailingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            child: Utility.fieldLabels(label,    isMandatory ?? false),
            visible: showLabel!,
            
          ),
          Visibility(
              visible: showLabel!,
              child: const SizedBox(
            height: 5.0,
          )),
          
          TextFormField(
            obscureText: obscureText!,
  
            style: Get.theme.textTheme.headlineSmall!.copyWith(fontSize: 15),
            decoration: InputDecoration(
              //labelText: "${label}*",
              //label: Utility.fieldLabels(label, isMandatory ?? false),
              //prefixIcon: Image.asset("assets/profile_twelve/search.png"),
              hintStyle: TextStyle( color: Get.isDarkMode ? Colors.grey : Colors.black87,),
              prefixIcon: suffixIcon != null ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(margin: EdgeInsets.only(bottom: 0.0),child: suffixIcon,),
                    ]
                ) : null,
              suffixIcon: actionIcon != null ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(margin: EdgeInsets.only(bottom: 0.0),child: actionIcon,),
                  ]
              ) : null,
                isDense: true,
                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(isCircular ?? false ? AppConstant.largeRadius : AppConstant.buttonRadius)),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Get.theme.primaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(isCircular ?? false ? AppConstant.largeRadius : AppConstant.smallRadius))),
             
                helperText: helperText,
                helperStyle: Get.theme.textTheme.titleSmall!.copyWith(fontSize: 8),
                filled: true,
                errorStyle: Get.theme.textTheme.titleSmall!.copyWith(color: Get.isDarkMode ? Colors.grey : Colors.black87,),
                hintText: hintText,
                //hintStyle: Get.theme.textTheme.titleSmall!,
                //errorStyle: Get.theme.textTheme.bodySmall!.copyWith(color: Colors.red)
              //hintStyle: Get.theme.textTheme.displaySmall

            ).applyDefaults(Get.theme.inputDecorationTheme),
            // decoration: showTrailingIcon!
            //     ? Utility.vNetInputDecoration(hintText, null, true)
            //     .copyWith(suffixIcon: suffixIcon)
            //     : Utility.vNetInputDecoration(hintText, null, true),
            readOnly: readOnly!,
            onTap: onTap,
            textAlign: TextAlign.start,
            maxLength: maxLength,
            //textCapitalization: TextCapitalization.characters,
            controller: textEditingController,
            validator: validate,
            keyboardType: textInputType,
            maxLines: maxLines,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}


class VButton extends StatelessWidget {
  double? height, width;
  String? text;
  void Function()? onClick;

  VButton({Key? key, this.height, this.width, this.text, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(

            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        height: height,
        width: width,
        child: Center(
          child: Center(
            child: Text(
              text!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}





class GradientText extends StatelessWidget {
  const GradientText(
      this.text, {
        required this.gradient,
        this.style,
      });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}






