import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web/models/contact_message.dart';
import 'package:portfolio_web/services/data_service.dart';
import 'package:portfolio_web/widgets/max_content_width.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final TextEditingController _cvController = TextEditingController();
  final DataService _dataService = DataService();

  @override
  void initState() {
    super.initState();
    // Initialize controller with current value if possible,
    // but stream handles updates. We set it once initially?
    // Actually better to let the user type freely.
    // We can listen once to populate it.
    _dataService.cvUrlStream.first.then((url) {
      if (mounted) {
        _cvController.text = url;
      }
    });
  }

  @override
  void dispose() {
    _cvController.dispose();
    super.dispose();
  }

  void _saveCvUrl() {
    _dataService.updateCvUrl(_cvController.text);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('CV URL updating...')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: MaxContentWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('CV Configuration'),
              20.verticalSpace,
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      StreamBuilder<String>(
                        stream: _dataService.cvUrlStream,
                        builder: (context, snapshot) {
                          return Text(
                            'Current: ${snapshot.data ?? 'Loading...'}',
                            style: TextStyle(color: Colors.grey.shade600),
                          );
                        },
                      ),
                      10.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _cvController,
                              decoration: const InputDecoration(
                                labelText: 'New CV URL',
                                border: OutlineInputBorder(),
                                helperText:
                                    'Enter the direct link to your CV PDF',
                              ),
                            ),
                          ),
                          20.horizontalSpace,
                          ElevatedButton(
                            onPressed: _saveCvUrl,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 20,
                              ),
                            ),
                            child: const Text('Update'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              60.verticalSpace,
              _buildSectionTitle('Contact Messages'),
              20.verticalSpace,
              StreamBuilder<List<ContactMessage>>(
                stream: _dataService.messagesStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  final messages = snapshot.data ?? [];

                  if (messages.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Text('No messages yet'),
                      ),
                    );
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: messages.length,
                    separatorBuilder: (context, index) => 20.verticalSpace,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return Card(
                        margin: EdgeInsets.zero,
                        child: ExpansionTile(
                          title: Text(
                            message.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${message.email} • ${message.timestamp.toString().split('.')[0]}',
                          ),
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20.0),
                              color: Colors.grey.shade50,
                              child: Text(message.message),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade800,
      ),
    );
  }
}
