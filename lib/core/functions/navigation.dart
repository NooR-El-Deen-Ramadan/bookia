import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> pushWithoutReplacment({
  required BuildContext context,
  required String route,
}) {
  return context.push(route);
}

pushWithReplacment({required BuildContext context, required String route}) {
  return context.pushReplacement(route);
}

pushAndRemoveUntil({required BuildContext context, required String route}) {
  return context.go(route);
}

pop(BuildContext context) {
  return context.pop();
}
