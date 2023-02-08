import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConditionalWidget extends GetView {
  final Widget body;
  final bool showIf;

  const ConditionalWidget({
    super.key,
    required this.body,
    required this.showIf,
  });

  @override
  Widget build(BuildContext context) => showIf ? body : Container();
}
