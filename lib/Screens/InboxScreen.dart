import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class InboxScreen extends StatefulWidget {
  final String clientName;
  final String clientImage;
  late String clientMessages;

  InboxScreen({required this.clientName, required this.clientImage, required clientMessages, required Map<String, String> client});

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final TextEditingController _messageController = TextEditingController();
  FilePickerResult? _selectedFile;
  String? _selectedFileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.clientImage),
            ),
            SizedBox(width: 10),
            Text(widget.clientName),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {
              // Implement audio call functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              reverse: true,
              children: [
                _buildMessage('Hello!', true),
                _buildMessage('Hi, how are you?', false),
                if (_selectedFile != null) _buildAttachmentPreview(),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessage(String text, bool isSentByUser) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Align(
        alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: isSentByUser ? Colors.red : Colors.grey[300],
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            text,
            style: TextStyle(color: isSentByUser ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: _pickFile,
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onSubmitted: (text) {
                _sendMessage();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.red),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final message = _messageController.text;
    if (message.isNotEmpty) {
      setState(() {
        // Add message to the chat (example)
      });
      _messageController.clear();
    }
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFile = result;
        _selectedFileName = result.files.single.name;
      });
    }
  }

  Widget _buildAttachmentPreview() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.attach_file, size: 40),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              _selectedFileName!,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
