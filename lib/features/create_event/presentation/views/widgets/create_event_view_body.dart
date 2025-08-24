import 'dart:io';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/core/widgets/custom_button.dart';
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
          showSnackBar(context, message: "Event Created Successfully!");
          Navigator.pop(context, true);
        } else if (state is CreateEventFailure) {
          showSnackBar(context, message: state.error);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                  ImagePickerField(
                    validator: (file) {
                      if (file == null) {
                        return "Please upload an image";
                      }
                      return null;
                    },
                    onSaved: (file) => selectedImage = file,
                  ),
                  const SizedBox(height: 10),
                  DropDownButtonFormField(
                    onChanged: (change) => selectedValue = change,
                    value: selectedValue,
                  ),
                  DatePickerField(
                    date: date,
                    onDateSelected: (picked) => setState(() => date = picked),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text:
                        state is CreateEventLoading
                            ? "Creating..."
                            : "Create Event",
                    onPressed: () {
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
                        formKey.currentState!.reset();
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
