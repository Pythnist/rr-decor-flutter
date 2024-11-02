
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rr_decor_flutter/utility/utility.dart';

import 'app_constant.dart';

class SocialLoginButton extends StatelessWidget {
  Color? color;
  String? title;
  String? imagePath;
  Color? textColor;
  void Function()? onClick;

  SocialLoginButton(
      {Key? key,
      this.color,
      this.title,
      this.imagePath,
      this.onClick,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        height: 44,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath!, height: 25, width: 25),
            Expanded(
                child: Container(
              child: Center(
                child: Text(
                  title!,
                  textAlign: TextAlign.start,
                  style: Get.theme.textTheme.titleSmall!
                      .copyWith(color: textColor!),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class TechMixinTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? textEditingController;
  final String? hintText;
  final TextInputType? textInputType;
  final String? Function(String?)? validate;
  final void Function()? onTap;
  final void Function(String? value)? onSave;
  final bool? readOnly;
  final dynamic maxLines;
  final bool? showTrailingIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? showLabel;
  final bool? isMandatory;
  final List<TextInputFormatter>? inputFormatters;

  const TechMixinTextField(
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
      this.onSave,
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
          Card(
            elevation: 0.0,
            color: Colors.transparent,
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(
            //         AppConstant.borderRadius)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //     color: Get.theme.primaryColor.withOpacity(0.10),
                //     spreadRadius: 5,
                //     blurRadius: 7,
                //     offset: const Offset(0, 3), // changes position of shadow
                //   ),
                //],
              ),
              child: TextFormField(
                obscureText: obscureText!,
                style: Get.theme.textTheme.headlineSmall,
                decoration: showTrailingIcon!
                    ? Utility.vNetInputDecoration(hintText, null, false)
                        .copyWith(suffixIcon: suffixIcon)
                    : Utility.vNetInputDecoration(hintText, null, false),
                readOnly: readOnly!,
                onTap: onTap,
                controller: textEditingController,
                validator: validate,
                keyboardType: textInputType,
                maxLines: maxLines,
                onSaved: onSave,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppThemeButton extends StatelessWidget {
  final void Function()? onClick;
  final String? label;
  final Color? color;
  final Color? textColor;
  const AppThemeButton({Key? key, this.onClick, this.label,this.color,this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetPlatform.isAndroid ? _androidButton() : _androidButton();
  }

  Widget _androidButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          minimumSize: const Size.fromHeight(50), // NEW
        ),
        onPressed: onClick,
        child: Text(
          label!,
          textScaler: TextScaler.linear(Get.textScaleFactor),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor,fontWeight: FontWeight.w600,letterSpacing: 1.5,fontSize: 16,),
        ),
      );

  Widget _iosButton() => CupertinoButton(
      color: color,
      child: Text(
        label!,
        style:
            Get.theme.textTheme.titleMedium!.copyWith(color: textColor),
      ),
      onPressed: onClick);
}

class AppThemeTextButton extends StatelessWidget {
  final void Function()? onClick;
  final String? label;
  const AppThemeTextButton({Key? key, this.onClick, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetPlatform.isAndroid ? _androidButton() : _iosButton();
  }

  Widget _androidButton() => ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      minimumSize: const Size.fromHeight(50), // NEW
    ),
    onPressed: onClick,
    child: Text(
      label!,
      style: Get.theme.textTheme.titleLarge!,
    ),
  );

  Widget _iosButton() => CupertinoButton(
      color: Colors.white,
      child: Text(
        label!,
        style:
        Get.theme.textTheme.titleLarge!.copyWith(color: Colors.black),
      ),
      onPressed: onClick);
}


