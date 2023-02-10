import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorContainer extends GetView {
  final String message;
  final EdgeInsets? margin;

  const ErrorContainer({
    super.key,
    this.margin,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      margin: margin,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            Icons.error_rounded,
            color: colorScheme.error,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Error!',
                  style: TextStyle(
                    color: colorScheme.onErrorContainer,
                    fontSize: textTheme.bodyLarge!.fontSize,
                  ),
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: colorScheme.onErrorContainer.withOpacity(.64),
                    fontSize: textTheme.bodyMedium!.fontSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
