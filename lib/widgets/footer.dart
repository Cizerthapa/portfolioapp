import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      color: Colors.blue.shade900,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Building amazing cross-platform experiences',
                    style: TextStyle(fontSize: 16, color: Colors.blue.shade200),
                  ),
                ],
              ),
              Row(
                children: [
                  _buildFooterLink('Home'),
                  const SizedBox(width: 30),
                  _buildFooterLink('About'),
                  const SizedBox(width: 30),
                  _buildFooterLink('Projects'),
                  const SizedBox(width: 30),
                  _buildFooterLink('Contact'),
                ],
              ),
            ],
          ),
          const Divider(color: Colors.blue, height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© ${DateTime.now().year} Cizer Thapa. All rights reserved.',
                style: TextStyle(color: Colors.blue.shade300),
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
