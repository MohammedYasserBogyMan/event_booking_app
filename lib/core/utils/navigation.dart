import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void goToNewScreen(
  BuildContext context, {
  required String locationOfNewScreen,
  Object? extra,
}) => GoRouter.of(context).go(locationOfNewScreen, extra: extra);

Future<Object?> pushToNewScreen(
  BuildContext context, {
  required String locationOfNewScreen,
  Object? extra,
}) => GoRouter.of(context).push(locationOfNewScreen, extra: extra);

void goToBackScreen(BuildContext context) => GoRouter.of(context).pop();