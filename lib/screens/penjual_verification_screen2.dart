import 'package:flutter/material.dart';
import '../screens/penjual_verification_screen3.dart';

class PenjualVerificationScreen2 extends StatefulWidget {
  const PenjualVerificationScreen2({Key? key}) : super(key: key);

  @override
  State<PenjualVerificationScreen2> createState() =>
      _PenjualVerificationScreen2State();
}

class _PenjualVerificationScreen2State
    extends State<PenjualVerificationScreen2> {
  final _formKey = GlobalKey<FormState>();

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
          padding: const EdgeInsets.all(24.0),
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
              const SizedBox(height: 24),
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
                    isActive: false,
                  ),
                  Step(
                    title: Text('Dokumen Tambahan'),
                    content: SizedBox.shrink(),
                  ),
                ],
              ),


              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nama Resto/Cafe:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Masukkan nama resto/cafe',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama resto/cafe tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Alamat Resto/Cafe:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Masukkan alamat resto/cafe',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Alamat resto/cafe tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                          ),
                          child: const Text('Kembali',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const PenjualVerificationScreen3(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFD700),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                          ),
                          child: const Text('Lanjut',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
