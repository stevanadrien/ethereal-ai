import 'package:flutter/material.dart';
import 'package:pic_2_plate_ai/screens/penjual_home_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PenjualVerificationScreen3 extends StatefulWidget {
  const PenjualVerificationScreen3({Key? key}) : super(key: key);

  @override
  State<PenjualVerificationScreen3> createState() =>
      _PenjualVerificationScreen3State();
}



class _PenjualVerificationScreen3State extends State<PenjualVerificationScreen3> {
  File? _image;
    File? _suratIzinUsahaImage;
    File? _sertifikatBPOMImage;
    File? _dokumenLegalitasProdukImage;
    bool _suratIzinUsahaImageUploaded = false;
  bool _sertifikatBPOMImageUploaded = false;
  bool _dokumenLegalitasProdukImageUploaded = false;
    final ImagePicker _picker = ImagePicker();
  // Add this variable to track image upload status
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
              const Center(
                child: Text(
                  'VERIFIKASI DATA',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins', // Add this line
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              // Progress indicator
              Stepper(
                currentStep: 0,
                controlsBuilder: (context, details) {
                  return Container(); // Return an empty container to remove the buttons
                },
                steps: const [
                  Step(
                    title: Text('Upload KTP'),
                    content: SizedBox.shrink(),
                    isActive: true,
                  ),
                  Step(
                    title: Text('Informasi Tambahan'),
                    content: SizedBox.shrink(),
                    isActive: true,
                  ),
                  Step(
                    title: Text('Dokumen Tambahan'),
                    content: SizedBox.shrink(),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Surat Izin Usaha:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: _suratIzinUsahaImage != null
                      ? Image.file(_suratIzinUsahaImage!)
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
                            _suratIzinUsahaImage = File(pickedImage.path);
                            _suratIzinUsahaImageUploaded = true;
                          });
                        }
                      }
                    },
                    child: const Text('+ Upload Surat Izin Usaha',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              const SizedBox(
                height: 16,
              ),
              const Text(
                "Sertifikat BPOM:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: _sertifikatBPOMImage != null
                      ? Image.file(_sertifikatBPOMImage!)
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
                            _sertifikatBPOMImage = File(pickedImage.path);
                            _sertifikatBPOMImageUploaded = true;
                          });
                        }
                      }
                    },
                    child: const Text('+ Upload Sertifikat BPOM',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 16,
              ),
              const Text(
                "Dokumen Legalitas Produk:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: _dokumenLegalitasProdukImage != null
                      ? Image.file(_dokumenLegalitasProdukImage!)
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
                            _dokumenLegalitasProdukImage = File(pickedImage.path);
                            _dokumenLegalitasProdukImageUploaded = true;
                          });
                        }
                      }
                    },
                    child: const Text('+ Upload Dokumen Legalitas Produk',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                    ),
                    child: const Text("Kembali",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                    ),
                  ),
         ElevatedButton(
            onPressed: _suratIzinUsahaImageUploaded &&
                _sertifikatBPOMImageUploaded &&
                _dokumenLegalitasProdukImageUploaded
                ? () {
              // Show pop-up message
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Dokumen sedang diproses', style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Poppins',)
                    ),
                    content: const Text(
                        'Dokumen Anda sedang dicek. Mohon tunggu beberapa saat.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => PenjualHomeScreen()),
                          );
                        },
                        child: const Text('OK'),
                      )
                    ],
                  );
                },
              );
            }
                : null, // Enable button only if all images are uploaded
            child: const Text('Selesai',
                style: TextStyle(
                  color: Colors.black,
                ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[700],
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

  Widget _buildProgressIndicator(int step, bool isActive) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? const Color(0xFFFFC107) : Colors.grey[300],
        border: Border.all(
          color: isActive ? const Color(0xFFFFC107) : Colors.grey[300]!,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          step.toString(),
          style: TextStyle(
            color: isActive ? Colors.black : Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
