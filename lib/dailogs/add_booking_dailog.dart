import 'package:flutter/material.dart';

class AddBookingDialog extends StatefulWidget {
  const AddBookingDialog({super.key});

  @override
  State<AddBookingDialog> createState() => _AddBookingDialogState();
}

class _AddBookingDialogState extends State<AddBookingDialog> {
  final _formKey = GlobalKey<FormState>();

  String? selectedCustomer;
  String service = "Football Turf";
  String status = "Pending";
  String duration = "1 hour";
  String time = "07:00 AM";

  final TextEditingController dateController = TextEditingController();
  final TextEditingController amountController =
      TextEditingController(text: "1200");
  final TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: 600,
        height: 650,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //================ HEADER =================//
            Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: const BoxDecoration(
                color: Color(0xFF2563EB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Add New Booking",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            //================ BODY =================//
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Customer
                        const Text(
                          "Customer",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: selectedCustomer,
                          decoration: InputDecoration(
                            hintText: "Select customer...",
                            filled: true,
                            fillColor: const Color(0xFFF8FAFC),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: "Arjun Mehta",
                              child: Text("Arjun Mehta"),
                            ),
                            DropdownMenuItem(
                              value: "Priya Sharma",
                              child: Text("Priya Sharma"),
                            ),
                            DropdownMenuItem(
                              value: "Rohit Verma",
                              child: Text("Rohit Verma"),
                            ),
                            DropdownMenuItem(
                              value: "Sneha Iyer",
                              child: Text("Sneha Iyer"),
                            ),
                            DropdownMenuItem(
                              value: "Karan Patel",
                              child: Text("Karan Patel"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedCustomer = value;
                            });
                          },
                        ),
                
                        const SizedBox(height: 20),
                
                        // Service & Status
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Service",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  DropdownButtonFormField<String>(
                                    value: service,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xFFF8FAFC),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    items: const [
                                      DropdownMenuItem(
                                        value: "Football Turf",
                                        child: Text("Football Turf"),
                                      ),
                                      DropdownMenuItem(
                                        value: "Cricket Turf",
                                        child: Text("Cricket Turf"),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        service = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Status",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  DropdownButtonFormField<String>(
                                    value: status,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xFFF8FAFC),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    items: const [
                                      DropdownMenuItem(
                                        value: "Pending",
                                        child: Text("Pending"),
                                      ),
                                      DropdownMenuItem(
                                        value: "Confirmed",
                                        child: Text("Confirmed"),
                                      ),
                                      DropdownMenuItem(
                                        value: "Cancelled",
                                        child: Text("Cancelled"),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        status = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                
                        const SizedBox(height: 20),
                
                        // Date & Time
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Date",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller: dateController,
                                    decoration: InputDecoration(
                                      hintText: "dd-mm-yyyy",
                                      suffixIcon:
                                          const Icon(Icons.calendar_today_outlined),
                                      filled: true,
                                      fillColor: const Color(0xFFF8FAFC),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Time",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  DropdownButtonFormField<String>(
                                    value: time,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xFFF8FAFC),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    items: const [
                                      DropdownMenuItem(
                                        value: "07:00 AM",
                                        child: Text("07:00 AM"),
                                      ),
                                      DropdownMenuItem(
                                        value: "08:00 AM",
                                        child: Text("08:00 AM"),
                                      ),
                                      DropdownMenuItem(
                                        value: "09:00 AM",
                                        child: Text("09:00 AM"),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        time = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                
                        const SizedBox(height: 20),
                
                        // Duration & Amount
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Duration",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  DropdownButtonFormField<String>(
                                    value: duration,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xFFF8FAFC),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    items: const [
                                      DropdownMenuItem(
                                        value: "1 hour",
                                        child: Text("1 hour"),
                                      ),
                                      DropdownMenuItem(
                                        value: "2 hours",
                                        child: Text("2 hours"),
                                      ),
                                      DropdownMenuItem(
                                        value: "3 hours",
                                        child: Text("3 hours"),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        duration = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Amount (₹)",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller: amountController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xFFF8FAFC),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                
                        const SizedBox(height: 5),
                
                        // Notes
                        const Text(
                          "Notes",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: notesController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: "Any special requirements...",
                            filled: true,
                            fillColor: const Color(0xFFF8FAFC),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                
                        const SizedBox(height: 6),
                
                        // Buttons
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text("Cancel"),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2563EB),
                                  minimumSize: const Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  "Save Booking",
                                  style: TextStyle(color: Colors.white),
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
            ),
          ],
        ),
      ),
    );
  }
}