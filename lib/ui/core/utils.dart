import 'package:flutter/material.dart';

void onShowModal(BuildContext context, Widget child) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (ctx) => child,
    );
  }
