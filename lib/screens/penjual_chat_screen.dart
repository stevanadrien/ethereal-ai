import 'package:flutter/material.dart';

class PenjualChatScreen extends StatefulWidget {
  @override
  _PenjualChatScreenState createState() => _PenjualChatScreenState();
}

class _PenjualChatScreenState extends State<PenjualChatScreen> {
  final List<String> _messages = [];
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(_messageController.text.trim());
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Messages',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.black, // Changed from Colors.white to Colors.black
          ),
        ),
        backgroundColor: Colors.yellow[800], // Changed from Color(0xFF0A6847) to Colors.yellow[800]
      ),
      body: Column(
        children: [
          Container(
            color: Colors.yellow[200], // Changed from Color(0xFF80C5AC) to Colors.yellow[200]
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/profile_picture.png'),
                  radius: 25,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Penjual',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black, // Changed from Colors.white to Colors.black
                      ),
                    ),
                    Text(
                      'Last online: 2 hours ago',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black54, // Changed from Colors.white to Colors.black54
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Removed the Divider
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                bool isSentByUser = index % 2 == 0;
                return Align(
                  alignment:
                  isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSentByUser
                          ? Colors.yellow[800] // Changed from Color(0xFF0A6847) to Colors.yellow[800]
                          : Colors.yellow[200], // Changed from Color(0xFFB9DFD2) to Colors.yellow[200]
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      _messages[index],
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: isSentByUser ? Colors.black : Colors.black, // Changed from Colors.white to Colors.black
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black54, // Changed from Colors.grey to Colors.black54
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow[800], // Changed from Color(0xFF0A6847) to Colors.yellow[800]
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.black), // Changed from Colors.white to Colors.black
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
