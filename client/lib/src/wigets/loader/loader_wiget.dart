import 'package:flutter/material.dart';

typedef DataWidgetBuilder<T> = Widget Function(BuildContext context, T data);

class LoaderFutureBuilder<T> extends StatelessWidget {
  final Future<T>? future;
  final DataWidgetBuilder<T> builder;
  final String emptyMessage;

  const LoaderFutureBuilder({
    super.key,
    required this.future,
    required this.builder,
    this.emptyMessage = 'No data found',
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text(emptyMessage));
        } else {
          return builder(context, snapshot.data as T);
        }
      },
    );
  }
}
