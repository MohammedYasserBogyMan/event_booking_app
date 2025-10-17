import 'dart:io';
import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerField extends FormField<File> {
  ImagePickerField({
    super.key,
    super.onSaved,
    super.validator,
    super.initialValue,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
  }) : super(
         builder: (FormFieldState<File> state) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               // Label
               Padding(
                 padding: const EdgeInsets.only(bottom: 12),
                 child: Text(
                   'Event Image',
                   style: Styels.textStyleMedium16,
                 ),
               ),

               // Image Preview or Upload Button
               if (state.value != null)
                 // Image Preview Container
                 Stack(
                   children: [
                     Container(
                       height: 220,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(16),
                         border: Border.all(
                           color: AppColor.primary.withValues(alpha: 0.3),
                           width: 2,
                         ),
                         boxShadow: [
                           BoxShadow(
                             color: Colors.black.withValues(alpha: 0.1),
                             blurRadius: 8,
                             offset: const Offset(0, 4),
                           ),
                         ],
                       ),
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(14),
                         child: Image.file(
                           state.value!,
                           fit: BoxFit.cover,
                           width: double.infinity,
                         ),
                       ),
                     ),
                     // Change Image Button
                     Positioned(
                       top: 12,
                       right: 12,
                       child: Material(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(30),
                         elevation: 4,
                         child: InkWell(
                           onTap: () async {
                             final picker = ImagePicker();
                             final XFile? pickedFile = await picker.pickImage(
                               source: ImageSource.gallery,
                               imageQuality: 85,
                             );
                             if (pickedFile != null) {
                               final file = File(pickedFile.path);
                               state.didChange(file);
                             }
                           },
                           borderRadius: BorderRadius.circular(30),
                           child: Container(
                             padding: const EdgeInsets.symmetric(
                               horizontal: 16,
                               vertical: 10,
                             ),
                             child: Row(
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 Icon(
                                   Icons.edit,
                                   color: AppColor.primary,
                                   size: 20,
                                 ),
                                 const SizedBox(width: 6),
                                 Text(
                                   'Change',
                                   style: Styels.textStyleMedium15.copyWith(
                                     color: AppColor.primary,
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
                 )
               else
                 // Upload Button
                 InkWell(
                   onTap: () async {
                     final picker = ImagePicker();
                     final XFile? pickedFile = await picker.pickImage(
                       source: ImageSource.gallery,
                       imageQuality: 85,
                     );
                     if (pickedFile != null) {
                       final file = File(pickedFile.path);
                       state.didChange(file);
                     }
                   },
                   borderRadius: BorderRadius.circular(16),
                   child: Container(
                     height: 220,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(16),
                       border: Border.all(
                         color: state.hasError
                             ? Colors.red
                             : AppColor.primary.withValues(alpha: 0.3),
                         width: 2,
                         style: BorderStyle.solid,
                       ),
                       color: AppColor.primary.withValues(alpha: 0.05),
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           padding: const EdgeInsets.all(20),
                           decoration: BoxDecoration(
                             color: AppColor.primary.withValues(alpha: 0.1),
                             shape: BoxShape.circle,
                           ),
                           child: Icon(
                             Icons.add_photo_alternate_outlined,
                             size: 48,
                             color: AppColor.primary,
                           ),
                         ),
                         const SizedBox(height: 16),
                         Text(
                           'Tap to upload event image',
                           style: Styels.textStyleMedium16.copyWith(
                             color: AppColor.primary,
                           ),
                         ),
                         const SizedBox(height: 8),
                         Text(
                           'JPG, PNG (Max 5MB)',
                           style: Styels.textStyleRegular14.copyWith(
                             color: Colors.grey[600],
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),

               // Error Message
               if (state.hasError)
                 Padding(
                   padding: const EdgeInsets.only(top: 8),
                   child: Text(
                     state.errorText!,
                     style: Styels.textStyleRegular14.copyWith(
                       color: Colors.red,
                     ),
                   ),
                 ),
             ],
           );
         },
       );
}
