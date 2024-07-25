import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddClientScreen extends StatefulWidget {
  @override
  _AddClientScreenState createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  final _formKey = GlobalKey<FormState>();
  FilePickerResult? _selectedFile;
  String? _selectedFileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Client'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField('Full Legal Name'),
              _buildTextField('Address'),
              _buildTextField('Email'),
              _buildTextField('Date of Birth'),
              _buildTextField('SSN'),
              _buildFilePickerField(),
              if (_selectedFileName != null) _buildFileThumbnail(),
              Spacer(),
              _buildAddButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: label,
          prefixIcon: Icon(Icons.text_fields),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildFilePickerField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();
          if (result != null) {
            setState(() {
              _selectedFile = result;
              _selectedFileName = result.files.single.name;
            });
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(Icons.attach_file),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  _selectedFileName ?? 'Attach File',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFileThumbnail() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            'assets/file_thumbnail.png', // Add a thumbnail asset or network image
            height: 40,
          ),
          SizedBox(width: 10),
          Text(
            _selectedFileName!,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() == true) {
          // Add client logic
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      ),
      child: Text(
        'Add',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
