import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

class AddClientScreen extends StatefulWidget {
  @override
  _AddClientScreenState createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  FilePickerResult? _selectedFile;
  String? _selectedFileName;
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _ssnController = TextEditingController();

  @override
  void dispose() {
    _dobController.dispose();
    _ssnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Client'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField('Full Legal Name'),
              _buildOptionalTextField('Address'),
              _buildTextField('Email'),
              _buildDateOfBirthField(),
              _buildOptionalSSNField(),
              _buildFilePickerField(),
              if (_selectedFileName != null) _buildFileThumbnail(),
              SizedBox(height: 20),
              _buildAddButton(context),
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
        onChanged: (value) {
          _formKey.currentState?.validate();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
        onSaved: (value) {
          _formData[label] = value!;
        },
      ),
    );
  }

  Widget _buildOptionalTextField(String label) {
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
        onChanged: (value) {
          _formKey.currentState?.validate();
        },
        onSaved: (value) {
          if (value != null && value.isNotEmpty) {
            _formData[label] = value;
          }
        },
      ),
    );
  }

  Widget _buildDateOfBirthField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: _dobController,
        decoration: InputDecoration(
          hintText: 'Date of Birth',
          prefixIcon: Icon(Icons.calendar_today),
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
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (pickedDate != null) {
            setState(() {
              _dobController.text = DateFormat('MM-dd-yyyy').format(pickedDate);
            });
          }
        },
        onSaved: (value) {
          if (value != null && value.isNotEmpty) {
            _formData['Date of Birth'] = value;
          }
        },
      ),
    );
  }

  Widget _buildOptionalSSNField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: _ssnController,
        decoration: InputDecoration(
          hintText: 'SSN',
          prefixIcon: Icon(Icons.lock),
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
        keyboardType: TextInputType.number,
        maxLength: 11,
        onChanged: (value) {
          _formKey.currentState?.validate();
          setState(() {
            _ssnController.value = TextEditingValue(
              text: _formatSSN(value),
              selection: TextSelection.collapsed(offset: _formatSSN(value).length),
            );
          });
        },
        onSaved: (value) {
          if (value != null && value.isNotEmpty) {
            _formData['SSN'] = value;
          }
        },
      ),
    );
  }

  String _formatSSN(String value) {
    value = value.replaceAll(RegExp(r'[^\d]'), '');
    if (value.length > 3 && value.length <= 5) {
      value = value.replaceRange(3, 3, '-');
    } else if (value.length > 5) {
      value = value.replaceRange(3, 3, '-');
      value = value.replaceRange(6, 6, '-');
    }
    if (value.length > 11) {
      value = value.substring(0, 11);
    }
    return value;
  }

  Widget _buildFilePickerField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 60),
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
          Icon(Icons.insert_drive_file, size: 40), // Display file icon
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

  Widget _buildAddButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() == true) {
          _formKey.currentState?.save();
          // Add client logic here
          _showClientAddedDialog(context);
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

  void _showClientAddedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 50),
                SizedBox(height: 10),
                Text(
                  'Client added',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
