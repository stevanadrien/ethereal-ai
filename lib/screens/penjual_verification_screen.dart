import 'package:flutter/material.dart';
import 'package:pic_2_plate_ai/screens/penjual_verification_screen2.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PenjualVerificationScreen extends StatefulWidget {
  const PenjualVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PenjualVerificationScreen> createState() => _PenjualVerificationScreenState();
}

class _PenjualVerificationScreenState extends State<PenjualVerificationScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _imageUploaded = false; // Add this variable to track image upload status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Center(
          child: Text(
            'FOOD RESCUE',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Person Icon Button Pressed'),
                  content: const Text('You pressed the person icon button'),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
        backgroundColor: Colors.yellow[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'VERIFIKASI DATA',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins', // Add this line
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Stepper(
                currentStep: 0,
                controlsBuilder: (context, details) {
                  return Container(); // Return an empty container to remove the buttons
                },
                steps: const [
                  Step(
                    title: Text('Upload KTP'),
                    content: SizedBox.shrink(),
                  ),
                  Step(
                    title: Text('Informasi Tambahan'),
                    content: SizedBox.shrink(),
                  ),
                  Step(
                    title: Text('Dokumen Tambahan'),
                    content: SizedBox.shrink(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16.0), // Add padding to the container
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Set a gray background color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Informasi kamu akan dilindungi Syarat Layanan dan Kebijakan Privasi masing-masing pihak untuk mematuhi peraturan dari otoritas terkait.',
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: _image != null
                      ? Image.file(_image!)
                      : TextButton(
                    onPressed: () async {
                      final source = await showDialog<ImageSource>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Pilih Sumber'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: const Text('Kamera'),
                                onTap: () {
                                  Navigator.of(context).pop(ImageSource.camera);
                                },
                              ),
                              ListTile(
                                title: const Text('Galeri'),
                                onTap: () {
                                  Navigator.of(context).pop(ImageSource.gallery);
                                },
                              ),
                            ],
                          ),
                        ),
                      );

                      if (source != null) {
                        final XFile? pickedImage = await _picker.pickImage(source: source);
                        if (pickedImage != null) {
                          setState(() {
                            _image = File(pickedImage.path);
                            _imageUploaded = true; // Set to true when image is uploaded
                          });
                        }
                      }
                    },
                    child: const Text('+ Upload KTP',
                      style: TextStyle(color: Colors.black ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Cara Mengambil Foto:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '1. Mohon upload foto KTP-mu dengan jelas (bukan fotokopi) untuk mencegah penolakan aplikasi.',
              ),
              const SizedBox(height: 8),
              const Text(
                '2. Posisikan KTP-mu dengan benar agar mencegah adanya pantulan cahaya, blur, terlalu gelap, dan terpotong.',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _image = null;
                          _imageUploaded = false; // Set to false when image is removed
                        });
                      },
                      child: const Text('Hapus Foto',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _imageUploaded
                          ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PenjualVerificationScreen2(), // Navigate to the new screen
                          ),
                        );
                      }
                          : null, // Enable button only if image is uploaded // Enable button only if image is uploaded
                      child: const Text('Lanjut',
                      style: TextStyle(
                        color: Colors.black,
                      )
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[700],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
