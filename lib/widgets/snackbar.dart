import 'package:flutter/material.dart';

class PrimarySnackbar extends StatefulWidget {
  const PrimarySnackbar({Key? key}) : super(key: key);

  @override
  State<PrimarySnackbar> createState() => _PrimarySnackbarState();
}

class _PrimarySnackbarState extends State<PrimarySnackbar> {
  @override
  void initState() {
    super.initState();
    snacc(context);
  }

  static void snacc(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('content'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
