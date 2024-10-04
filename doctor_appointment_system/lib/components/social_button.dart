import 'package:flutter/material.dart';

import '../utils/config.dart';

class SocialButton extends StatefulWidget {
  const SocialButton({Key? key, required this.social}) : super(key: key);

  final String social;

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return OutlinedButton(
        // style: OutlinedButton.styleFrom(
        //     // padding: const EdgeInsets.symmetric(vertical: 15),
        //     // side: const BorderSide(width: 1, color: Colors.black),
        //     ),
        onPressed: () {},
        child: SizedBox(
          // width: Config.screenWidth = 0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'assets/${widget.social}.png',
                width: 40,
                height: 20,
              ),
              Text(
                widget.social.toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ));
  }
}
