// import 'package:flutter/material.dart';

// class ResumeInputField extends StatelessWidget {
//   final String label;
//   final String hint;
//   final bool obscure;
//   final Widget? suffixIcon;
//   final TextEditingController controller;

//   const ResumeInputField({
//     super.key,
//     required this.label,
//     required this.hint,
//     required this.controller,
//     this.obscure = false,
//     this.suffixIcon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
//         ),
//         const SizedBox(height: 8),
//         TextFormField(
//           controller: controller,
//           obscureText: obscure,
//           decoration: InputDecoration(
//             hintText: hint,
//             filled: true,
//             fillColor: Colors.white,
//             contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
//             suffixIcon: suffixIcon,
//           ),
//         ),
//       ],
//     );
//   }
// }
