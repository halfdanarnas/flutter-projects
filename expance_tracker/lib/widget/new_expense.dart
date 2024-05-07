import 'package:expance_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';


final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
 const NewExpense ({super.key});

  @override
  State<NewExpense> createState() {
  return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
 final _titleController = TextEditingController();
final _amountController = TextEditingController();
 DateTime? _selectDate;
Category _selectedCategory = Category.leisure;

void _presentDatePicker () async {
  final now = DateTime.now();
  final firstDate = DateTime(now.year - 1, now.month, now.day);
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: now,
    firstDate: firstDate, 
    lastDate: now,
    );
    setState(() {
      _selectDate = pickedDate;
    });
}

void _submitExpenseData() {
  final enteredAmound = double.tryParse(_amountController.text);
  final amountIsInvalid = enteredAmound == null || enteredAmound <= 0;
  if (_titleController.text.trim().isEmpty || 
  amountIsInvalid || 
  _selectDate == null){
    

  }
}

 @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title')
            ),
          ),
          Row(
            children: [
             Expanded(child: TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: '\$ ',
              label: Text('Amount')
            ),
          ),
             ),
          const SizedBox(width: 16),
           Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                Text(
                   _selectDate == null
                    ?'No Date selected' 
                    : formatter.format(_selectDate!),
                    ),
                IconButton(
                  onPressed: _presentDatePicker,
                  icon: const Icon
                  (Icons.calendar_month,
                  ),
                  ),      
              ],
            ),
          ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                .map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(
                      category.name.toUpperCase(),
                    ),
                    ),
                  )
                  .toList(),
                   onChanged: (value) {
                    if (value == null) {
                        return;
                      }
                    setState(() {
                      _selectedCategory = value;
                    });
                   },
                   ),
                   const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                }, 
              child: const Text('Cancel'),
              ),
            ElevatedButton(
              onPressed: _submitExpenseData,
               child: const Text('Save Expense'),
            ),
          ],
          ),
      ],
      ),
    );
  }
}