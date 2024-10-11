import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // To format the date and time

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ToDoListScreen(),
    );
  }
}

class Task {
  String title;
  String priority;
  DateTime dateTime;

  Task({required this.title, required this.priority, required this.dateTime});
}

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  List<Task> _tasks = [];
  final TextEditingController _controller = TextEditingController();
  String _selectedPriority = 'Low';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _addTask(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _tasks.add(Task(
          title: task,
          priority: _selectedPriority,
          dateTime: DateTime(
            _selectedDate.year,
            _selectedDate.month,
            _selectedDate.day,
            _selectedTime.hour,
            _selectedTime.minute,
          ),
        ));
        _controller.clear();
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Listify - ToDo List',
          style: TextStyle(
            color: Colors.white, // Change this to your desired color
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Priority and Date/Time Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrioritySelector(
                  selectedPriority: _selectedPriority,
                  onPrioritySelected: (newValue) {
                    setState(() {
                      _selectedPriority = newValue;
                    });
                  },
                ),
                DateTimeSelector(
                  selectedDate: _selectedDate,
                  selectedTime: _selectedTime,
                  onDateSelected: () => _selectDate(context),
                  onTimeSelected: () => _selectTime(context),
                ),
              ],
            ),
            SizedBox(
                height: 16), // Space between the selectors and the text field
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final task = _tasks[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    color: _getColorForPriority(task.priority),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Priority Text
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Priority: ${task.priority}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _getColorForPriority(task.priority),
                              ),
                            ),
                          ),
                          // Due Date and Time Text
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Due: ${DateFormat('yMd').format(task.dateTime)} ${DateFormat('jm').format(task.dateTime)}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          // Task Title
                          Text(
                            task.title,
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _tasks.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Enter a new task',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      onSubmitted: _addTask,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle, size: 40, color: Colors.teal),
                    onPressed: () => _addTask(_controller.text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorForPriority(String priority) {
    switch (priority) {
      case 'High':
        return Colors.red.shade100; // Light red for high priority
      case 'Medium':
        return Colors.yellow.shade100; // Light yellow for medium priority
      case 'Low':
      default:
        return Colors.green.shade100; // Light green for low priority
    }
  }
}

class PrioritySelector extends StatelessWidget {
  final String selectedPriority;
  final Function(String) onPrioritySelected;

  PrioritySelector({
    required this.selectedPriority,
    required this.onPrioritySelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedPriority,
      items: <String>['Low', 'Medium', 'High']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        onPrioritySelected(newValue!);
      },
    );
  }
}

class DateTimeSelector extends StatelessWidget {
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final Function() onDateSelected;
  final Function() onTimeSelected;

  DateTimeSelector({
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateSelected,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: ${DateFormat('yMd').format(selectedDate)}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Time: ${selectedTime.format(context)}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        SizedBox(width: 8), // Space between date/time and icons
        IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: onDateSelected,
        ),
        IconButton(
          icon: Icon(Icons.access_time),
          onPressed: onTimeSelected,
        ),
      ],
    );
  }
}
