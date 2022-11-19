import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:toast/toast.dart';

class CopyableText extends StatelessWidget {
  final String data;
  final TextStyle style;

  const CopyableText({
    Key? key,
    required this.data,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MaterialButton(
      child: Text(data, style: style, textAlign: TextAlign.center),
      onPressed: () {
        Clipboard.setData(ClipboardData(text: data));

        Toast.show("Copy !!",
            duration: Toast.lengthShort, gravity: Toast.center);
      },
    );
  }
}
