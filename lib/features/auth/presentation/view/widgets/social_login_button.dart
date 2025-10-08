import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({required this.image, required this.text, super.key});
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(image)),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                text,
                style: Styels.textStyleRegular16.copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}