import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _titleController = TextEditingController();
  String selectedEmoji = '';
  Color selectedColor = Colors.white;
  double dailyAmount = 0.0;
  double totalAmount = 0.0;
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 10),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          selectedDate.hour,
          selectedDate.minute,
          selectedDate.second,
        );
      });
    }
  }

  void showEmojiPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return EmojiPicker(
          onEmojiSelected: (Category? category, Emoji emoji) {
            setState(() {
              selectedEmoji = emoji.emoji;
              Navigator.of(context).pop();
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Title',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'Enter title',
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Select Emoji',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => showEmojiPicker(context),
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: Icon(
                    Icons.emoji_emotions,
                    color: Colors.black,
                    size: 28.0,
                  ),
                ),
              ),
              Text(
                selectedEmoji,
                style: TextStyle(fontSize: 28.0),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            'Select Background Color',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildColorSelection(Color(0xFFE57373)),
              buildColorSelection(Color(0xFFFF8A65)),
              buildColorSelection(Color(0xFFFFD54F)),
              buildColorSelection(Color(0xFF4FC3F7)),
              buildColorSelection(Color(0xFF9575CD)),
              buildColorSelection(Color(0xFF81C784)),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            'Daily Amount',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                dailyAmount = double.parse(value);
              });
            },
            decoration: InputDecoration(
              hintText: 'Enter daily amount',
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Total Amount',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                totalAmount = double.parse(value);
              });
            },
            decoration: InputDecoration(
              hintText: 'Enter total amount',
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Select Date',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          TextButton(
            onPressed: () => selectDate(context),
            child: Text(
              selectedDate.toString().split(' ')[0],
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Perform your save logic here
              // Access the entered values using the respective variables
            },
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildColorSelection(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: selectedColor == color
            ? Icon(
                Icons.check,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
