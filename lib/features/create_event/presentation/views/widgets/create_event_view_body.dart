import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/widgets/date_picker_field.dart';
import 'package:event_booking_app/core/widgets/location_picker_widget.dart';
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
  String? title, description, subLocation, price, attendeesCount, maxCapacity;
  GeoPoint? locationCoordinates;
  String? locationAddress; // City/Area from map

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateEventCubit, CreateEventState>(
      listener: (context, state) {
        if (state is CreateEventSuccess) {
          showSuccessSnackBar(
            context,
            message: "Event created successfully",
          );
          Navigator.pop(context, true);
        } else if (state is CreateEventFailure) {
          showErrorSnackBar(
            context,
            message: state.error,
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
                    'Event Details',
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
                    'Basic Information',
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
                      subLocation = values["subLocation"];
                      price = values["price"];
                      attendeesCount = values["attendeesCount"];
                      maxCapacity = values["maxCapacity"];
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

                  const SizedBox(height: 24),

                  // Location Picker Button
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationPickerWidget(
                            initialLocation: locationCoordinates,
                            initialAddress: locationAddress,
                            onLocationSelected: (coordinates, address) {
                              setState(() {
                                locationCoordinates = coordinates;
                                locationAddress = address;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: locationCoordinates != null
                                ? AppColor.primary
                                : Colors.grey,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              locationAddress ?? 'Select Event Location on Map',
                              style: TextStyle(
                                fontSize: 16,
                                color: locationCoordinates != null
                                    ? Colors.black87
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey.shade400,
                          ),
                        ],
                      ),
                    ),
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
                                      location: locationAddress ?? 'Unknown Location',
                                      subLocation: subLocation ?? '',
                                      category: selectedValue!,
                                      price: price!,
                                      attendeesCount: attendeesCount,
                                      maxCapacity: maxCapacity,
                                      date: date!,
                                      image: selectedImage,
                                      locationCoordinates: locationCoordinates,
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
                              "Create Event",
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
