import 'package:flutter/material.dart';
import 'package:movie_app/constants/MyAppIcons.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget(
      {super.key, required this.errorText, required this.retryFunction});
  final String errorText;
  final Function retryFunction;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(MyappIcons.error,
          size: 50,
            color: Colors.red,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Error: $errorText',
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              retryFunction();
            },
            child: const Text(
              "Retry",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
