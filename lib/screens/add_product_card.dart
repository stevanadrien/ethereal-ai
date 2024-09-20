import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:pic_2_plate_ai/models/product.dart';

class AddProductCard extends StatefulWidget {

  const AddProductCard({Key? key}) : super(key: key);

  @override
  State<AddProductCard> createState() => _AddProductCardState();
}

class _AddProductCardState extends State<AddProductCard> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final _namaMakananController = TextEditingController();
  final _deskripsiMakananController = TextEditingController();
  final _kadaluwarsaController = TextEditingController();
  final _hargaMakananController = TextEditingController();
  int _stok = 2;
  int _jangkauan = 2;
  String? _jenisMakanan;


  Future<void> _selectImage(ImageSource source) async {
    try {
      final XFile? pickedImage = await _picker.pickImage(source: source);
      if (pickedImage != null) {
        setState(() {
          _image = File(pickedImage.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }



  @override
  void dispose() {
    _namaMakananController.dispose();
    _deskripsiMakananController.dispose();
    _kadaluwarsaController.dispose();
    _hargaMakananController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
        centerTitle: true,
        title: Text(
          'Food Rescue',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
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
                      onPressed: () {
                        showDialog<ImageSource>(
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
                        ).then((source) async {
                          if (source != null) {
                            final XFile? pickedFile = await ImagePicker().pickImage(source: source);
                            if (pickedFile != null) {
                              setState(() {
                                _image = File(pickedFile.path); // update the _image variable
                              });
                            }
                          }
                        });
                      },
                      child: const Text('+ Tambahkan Gambar Makanan',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Nama makanan
                TextFormField(
                  controller: _namaMakananController,
                  decoration: const InputDecoration(
                    labelText: "Nama makanan:",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Masukkan nama makanan";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Deskripsi makanan
                TextFormField(
                  controller: _deskripsiMakananController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: "Deskripsi makanan:",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Masukkan deskripsi makanan";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Jenis makanan
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Jenis makanan:",
                  ),
                  value: _jenisMakanan,
                  onChanged: (newValue) {
                    setState(() {
                      _jenisMakanan = newValue;
                    });
                  },
                  items: <String>['Sayur', 'Buah', 'Seafood', 'Makanan pokok', 'Rempah']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih jenis makanan';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Kadaluwarsa
                TextFormField(
                  controller: _kadaluwarsaController,
                  decoration: const InputDecoration(
                    labelText: "Kadaluwarsa:",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Masukkan kadaluwarsa";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Stok
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Stok:"),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _stok--;
                            });
                          },
                          icon: const Icon(Icons.remove_circle),
                        ),
                        Text(_stok.toString()),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _stok++;
                            });
                          },
                          icon: const Icon(Icons.add_circle),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Harga makanan
                TextFormField(
                  controller: _hargaMakananController,
                  decoration: const InputDecoration(
                    labelText: "Harga makanan:",
                    hintText: "Rp xx.xxx / pcs",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Masukkan harga makanan";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Jangkauan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Jangkauan (km):"),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _jangkauan--;
                            });
                          },
                          icon: const Icon(Icons.remove_circle),
                        ),
                        Text(_jangkauan.toString()),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _jangkauan++;
                            });
                          },
                          icon: const Icon(Icons.add_circle),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Tombol Bersihkan dan Simpan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                        _namaMakananController.clear();
                        _deskripsiMakananController.clear();
                        _kadaluwarsaController.clear();
                        _hargaMakananController.clear();
                        _stok = 2;
                        _jangkauan = 2;
                        _jenisMakanan = null;
                        setState(() {
                          _image = null;
                        });
                      },
                      child: const Text("Bersihkan",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (_image != null) {
                            Product product = Product(
                              id: DateTime.now().toString(), // Generate a unique ID
                              title: _namaMakananController.text,
                              description: _deskripsiMakananController.text,
                              price: double.parse(_hargaMakananController.text),
                              imageUrl: _image?.path ?? '', // Use the null-aware operator ?. to access path
                              expirationDate: _kadaluwarsaController.text,
                              distance: _jangkauan.toString(),
                              foodType: _jenisMakanan!,
                              location: '', // You need to set the location
                              priceRange: '', // You need to set the price range
                              stok: _stok,  // Assuming _stokQuantity is the value from the quantity controller button
                            );

                            // Assuming HomeScreen is the parent widget
                            Navigator.of(context).pop(product);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please select an image'),
                              ),
                            );
                          }
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: const Text("Simpan",
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
        ),
      ),
    );
  }
}
