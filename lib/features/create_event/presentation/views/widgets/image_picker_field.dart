import 'dart:io';
import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

// حولت هنا من ستيت فول ل فورم فيلد عادي بس نوعه فايل علشان هياخد صوره
class ImagePickerField extends FormField<File> {
  ImagePickerField({
    super.key,
    super.onSaved,
    super.validator,
    super.initialValue,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
  }) : super(
         builder: (FormFieldState<File> state) {
           // هنا بقى بنبني الويجت بتاعنا وهقدر اجيب ال ستيت بتاعها
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   elevation: 4,
                   backgroundColor: Colors.white,
                   foregroundColor: AppColor.primary,
                 ),
                 onPressed: () async {
                   final picker =
                       ImagePicker(); // هنا بستخدم ال image picker علشان يفتح الجاليرى
                   final XFile? pickedFile = await picker.pickImage(
                     // وباخد الصوره اللى اختارها بحولها لفايل
                     source: ImageSource.gallery, // اختار من الجالري
                   );
                   if (pickedFile != null) {
                     // لو فعلا اختار صوره
                     final file = File(pickedFile.path); // حولها ل فايل عادي

                     state.didChange(
                       file,
                     ); // حدث ال ستيت بتاع الفورم فيلد بالصوره اللى اختارها
                   }
                 },
                 child: Text(
                   "Choose Photo",
                   style: Styels.textStyleRegular14.copyWith(
                     fontWeight: FontWeight.bold,
                     color: Colors.black
                   ),
                 ),
               ),
               if (state.value !=
                   null) // لو في قيمه اعرض اسم الصوره الي اختارتها
                 Text(
                   "File Name: ${path.basename(state.value!.path)}",
                   style: Styels.textStyleRegular14.copyWith(color: Colors.black),
                 ),
               if (state.hasError)
                 Padding(
                   padding: const EdgeInsets.only(top: 5),
                   child: Text(
                     state.errorText!,
                     style: const TextStyle(color: Colors.red, fontSize: 12),
                   ),
                 ),
             ],
           );
         },
       );
}
