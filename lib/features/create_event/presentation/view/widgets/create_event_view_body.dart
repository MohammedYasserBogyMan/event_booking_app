import 'dart:io';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
import 'package:event_booking_app/core/widgets/date_picker_field.dart';
import 'package:event_booking_app/features/create_event/presentation/manager/create_event_cubit/cubit/create_event_cubit.dart';
import 'package:event_booking_app/features/create_event/presentation/view/widgets/buil_text_field_section.dart';
import 'package:event_booking_app/features/create_event/presentation/view/widgets/custom_category_drop_down.dart';
import 'package:event_booking_app/features/create_event/presentation/view/widgets/image_picker_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateEventViewBody extends StatefulWidget {
  const CreateEventViewBody({super.key});

  @override
  State<CreateEventViewBody> createState() => _CreateEventViewBodyState();
}

class _CreateEventViewBodyState extends State<CreateEventViewBody> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final subLocationController = TextEditingController();
  final maxAttendeesController = TextEditingController();
  final priceController = TextEditingController();

  String? category;
  DateTime? date;
  File? selectedImage;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    subLocationController.dispose();
    maxAttendeesController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateEventCubit, CreateEventState>(
      listener: (context, state) {
        if (state is CreateEventSuccess) {
          showSnackBar(context, message: "Event Created Successfully!");
          Navigator.pop(context, true);
        } else if (state is CreateEventFailure) {
          showSnackBar(context, message: state.error);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                BuildTextFieldSection(
                  titleController: titleController,
                  descriptionController: descriptionController,
                  locationController: locationController,
                  subLocationController: subLocationController,
                  maxAttendeesController: maxAttendeesController,
                  priceController: priceController,
                ),
                ImagePickerField(
                  validator: (file) {
                    if (file == null) {
                      return "Please upload an image";
                    }
                    return null;
                  },
                  onSaved: (file) => selectedImage = file,
                ),
                const SizedBox(height: 16),
                CustomCategoryDropDown(
                  value: category,
                  onChanged: (value) => setState(() => category = value),
                ),
                const SizedBox(height: 16),
                DatePickerField(
                  date: date,
                  onDateSelected: (picked) => setState(() => date = picked),
                ),
                const SizedBox(height: 32),

                CustomButton(
                  text:
                      state is CreateEventLoading
                          ? "Creating..."
                          : "Create Event",
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        date != null &&
                        category != null) {
                      _formKey.currentState!.save();

                      context.read<CreateEventCubit>().submitEvent(
                        title: titleController.text,
                        description: descriptionController.text,
                        location: locationController.text,
                        subLocation: subLocationController.text,
                        category: category!,
                        price: priceController.text,
                        maxAttendees: maxAttendeesController.text,
                        date: date!,
                        image: selectedImage!,
                      );
                    } else if (date == null) {
                      showSnackBar(context, message: "Please select a date");
                    } else if (category == null) {
                      showSnackBar(
                        context,
                        message: "Please select a category",
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
