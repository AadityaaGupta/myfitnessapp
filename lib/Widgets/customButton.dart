import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String? title;
  final Function? ontap;

  const CustomButton(this.ontap, this.title, {super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.ontap?.call(),
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.title ?? "",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
