import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tufbooking/components/dashboard_cards.dart';
import 'package:tufbooking/data/booking_data.dart';

class DashboardPages extends StatelessWidget {
  const DashboardPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 50,
        title: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dashboard",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Wednesday, 8 July 2026",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 18,
              ),
              label: const Text(
                "New Booking",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1D4ED8),
                minimumSize: const Size(140, 42),
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Dashboard Cards Row - Fixed with Wrap for responsiveness
        Row(
  children: const [
    Expanded(
      child: DashboardCards(
        title: "TOTAL BOOKINGS",
        value: "6",
        subtitle: "3 confirmed",
        icon: Icons.assignment_outlined,
        iconColor: Color(0xFF2563EB),
        iconBg: Color(0xFFEFF6FF),
      ),
    ),
    SizedBox(width: 20),

    Expanded(
      child: DashboardCards(
        title: "ACTIVE CUSTOMERS",
        value: "5",
        subtitle: "Registered Members",
        icon: Icons.people_outline,
        iconColor: Color(0xFF4F46E5),
        iconBg: Color(0xFFEEF2FF),
      ),
    ),
    SizedBox(width: 20),

    Expanded(
      child: DashboardCards(
        title: "PENDING",
        value: "2",
        subtitle: "Awaiting Confirmation",
        icon: Icons.error_outline,
        iconColor: Color(0xFFD97706),
        iconBg: Color(0xFFFEF3C7),
      ),
    ),
    SizedBox(width: 20),

    Expanded(
      child: DashboardCards(
        title: "REVENUE",
        value: "₹5,400",
        subtitle: "From Confirmed Bookings",
        icon: Icons.trending_up,
        iconColor: Color(0xFF16A34A),
        iconBg: Color(0xFFDCFCE7),
      ),
    ),
  ],
),
            const SizedBox(height: 24),
            Container(
             constraints: const BoxConstraints(
    minHeight: 400,
    maxHeight: 400, // change container height here
    
    minWidth: double.infinity,
  ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Bookings",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                "View all",
                                style: TextStyle(
                                  color: Colors.blue.shade800,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(
                                Icons.chevron_right,
                                size: 16,
                                color: Colors.blue.shade800,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                   
                    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: DataTable(
      headingRowColor: WidgetStateProperty.all(
        Colors.grey.shade100,
      ),
    columns: const [
  DataColumn(label: SizedBox(width: 180, child: Text("Booking ID"))), //sized box needed for spacing to cover the table to fill container
  DataColumn(label: SizedBox(width: 180, child: Text("Customer"))),
  DataColumn(label: SizedBox(width: 180, child: Text("Service"))),
  DataColumn(label: SizedBox(width: 180, child: Text("Date"))),
  DataColumn(label: SizedBox(width: 180, child: Text("Amount"))),
  DataColumn(label: SizedBox(width: 180, child: Text("Status"))),
],
      rows: const [
        DataRow(
          cells: [
            DataCell(SizedBox(
              width: 180,child: Text("B001"),
              ),
              ),
            DataCell(Text("Arjun Mehta")),
            DataCell(Text("Football Turf")),
            DataCell(Text("10 Jul 2026.06:00 AM")),
            DataCell(Text("₹1,200")),
            DataCell(Text("Confirmed")),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text("B002")),
            DataCell(Text("Priya Sharma")),
            DataCell(Text("Cricket Net")),
            DataCell(Text("11 Jul 2025.08:00 AM")),
            DataCell(Text("₹800")),
            DataCell(Text("Pending")),
          ],
        ),
        
         DataRow(
          cells: [
            DataCell(SizedBox(
              width: 90,child: Text("B003"),
              ),
              ),
            DataCell(Text("Rohit Verma")),
            DataCell(Text("Football Turf")),
            DataCell(Text("12 Jul 2025.05:00 PM")),
            DataCell(Text("₹1,800")),
            DataCell(Text("Confirmed")),
          ],
        ),
        
         DataRow(
          cells: [
            DataCell(SizedBox(
              width: 180,child: Text("B004"),
              ),
              ),
            DataCell(Text("Sneha Iyer")),
            DataCell(Text("Badminton Court")),
            DataCell(Text("13 Jul 2025.07:00 AM")),
            DataCell(Text("₹600")),
            DataCell(Text("Cancelled")),
          ],
        ),
         DataRow(
          cells: [
            DataCell(SizedBox(
              width: 180,child: Text("B005"),
              ),
              ),
            DataCell(Text("Karan Patel")),
            DataCell(Text("Football Turf")),
            DataCell(Text("14 Jul 2025.06:00 PM")),
            DataCell(Text("₹2,400")),
            DataCell(Text("Confirmed")),
          ],
        ),
        
        
      ],
    ),
                   
                   ),  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

