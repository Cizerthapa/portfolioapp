import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
      color: Colors.blue.shade900,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    'Building amazing cross-platform experiences',
                    style: TextStyle(fontSize: 16, color: Colors.blue.shade200),
                  ),
                ],
              ),
              Row(
                children: [
                  _buildFooterLink('Home'),
                  30.horizontalSpace,
                  _buildFooterLink('About'),
                  30.horizontalSpace,
                  _buildFooterLink('Projects'),
                  30.horizontalSpace,
                  _buildFooterLink('Contact'),
                ],
              ),
            ],
          ),
          const Divider(color: Colors.blue, height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '© ${DateTime.now().year} Cizer Thapa. All rights reserved.',
                    style: TextStyle(color: Colors.blue.shade300),
                  ),
                  4.verticalSpace,
                  Text(
                    'Dedicated to Sangya Aryal ❤️',
                    style: TextStyle(
                      color: Colors.blue.shade300,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.code, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.work, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.chat, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.mail, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
