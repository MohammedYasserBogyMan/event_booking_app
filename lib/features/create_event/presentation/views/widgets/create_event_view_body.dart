import 'dart:io';
import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/widgets/date_picker_field.dart';
import 'package:event_booking_app/features/create_event/presentation/manager/create_event_cubit/create_event_cubit.dart';
import 'package:event_booking_app/features/create_event/presentation/views/widgets/image_picker_field.dart';
import 'package:event_booking_app/features/create_event/presentation/views/widgets/create_event_fields.dart';
import 'package:event_booking_app/features/create_event/presentation/views/widgets/drop_down_button_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateEventViewBody extends StatefulWidget {
  const CreateEventViewBody({super.key});

  @override
  State<CreateEventViewBody> createState() => _CreateEventViewBodyState();
}

class _CreateEventViewBodyState extends State<CreateEventViewBody> {
  String? selectedValue;
  File? selectedImage;

  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  DateTime? date;
  String? title, description, location, subLocation, price, attendeesCount;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateEventCubit, CreateEventState>(
      listener: (context, state) {
        if (state is CreateEventSuccess) {
          showSnackBar(
            context,
            message: "✅ Event Created Successfully!",
          );
          Navigator.pop(context, true);
        } else if (state is CreateEventFailure) {
          showSnackBar(
            context,
            message: "❌ ${state.error}",
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is CreateEventLoading;

        return SafeArea(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  const Text(
                    '📝 Event Details',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Fill in the information below to create your event',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Image Upload Section
                  ImagePickerField(
                    validator: (file) {
                      if (file == null) {
                        return "Please upload an event image";
                      }
                      return null;
                    },
                    onSaved: (file) => selectedImage = file,
                  ),
                  const SizedBox(height: 30),

                  // Divider
                  const Divider(height: 1),
                  const SizedBox(height: 30),

                  // Form Fields Section
                  const Text(
                    'ℹ️ Basic Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),

                  CreateEventTextFields(
                    onSaved: (values) {
                      title = values["title"];
                      description = values["description"];
                      location = values["location"];
                      subLocation = values["subLocation"];
                      price = values["price"];
                      attendeesCount = values["attendeesCount"];
                    },
                  ),

                  const SizedBox(height: 24),

                  // Category Dropdown
                  DropDownButtonFormField(
                    onChanged: (change) => selectedValue = change,
                    value: selectedValue,
                  ),

                  const SizedBox(height: 24),

                  // Date Picker
                  DatePickerField(
                    date: date,
                    onDateSelected: (picked) => setState(() => date = picked),
                  ),

                  const SizedBox(height: 40),

                  // Create Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                context.read<CreateEventCubit>().submitEvent(
                                      title: title!,
                                      description: description!,
                                      location: location!,
                                      subLocation: subLocation!,
                                      category: selectedValue!,
                                      price: price!,
                                      attendeesCount: attendeesCount,
                                      date: date!,
                                      image: selectedImage,
                                    );
                              } else {
                                setState(() {
                                  autovalidateMode = AutovalidateMode.always;
                                });
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isLoading ? Colors.grey : AppColor.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: isLoading ? 0 : 4,
                      ),
                      child: isLoading
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  "Creating Event...",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          : const Text(
                              "🎉 Create Event",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
