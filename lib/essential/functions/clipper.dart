import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
  // Create a new instance of the Path class.
  var path = Path();

  // Start the path at the top-left corner of the container.
  path.lineTo(0, size.height - 50);

  // Create a quadratic Bezier curve that connects the top-left corner to the top-right corner of the container.
  // The control point is positioned horizontally at the center of the container.
  path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);

  // Draw a straight line from the top-right corner to the bottom-right corner of the container.
  path.lineTo(size.width, 0);

  // Close the path by connecting the bottom-right corner to the top-left corner of the container.
  path.close();

  // Return the completed path.
  return path;
}

  @override
  bool shouldReclip (CustomClipper<Path> oldClipper) {
    return false;
  }

}