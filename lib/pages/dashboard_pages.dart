import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tufbooking/components/customer_tile.dart';
import 'package:tufbooking/components/dashboard_cards.dart';
import 'package:tufbooking/data/booking_data.dart';
import 'package:tufbooking/components/status_badge.dart';
import 'package:tufbooking/data/customer_data.dart';
import '../dailogs/add_booking_dailog.dart';

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
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                
              _showAddBookingDialog(context);
                
                
                
              },
              icon: const Icon(Icons.add, color: Colors.white, size: 12),
              label: const Text(
                "New Booking",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1D4ED8),
                minimumSize: const Size(100, 42),
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
            // Dashboard Cards Row
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
              width: double.infinity,
              constraints: const BoxConstraints(minWidth: double.infinity),
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
                        const Text(
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

                  LayoutBuilder(
                    builder: (context, constraints) {
                      final w = constraints.maxWidth;

                      return DataTable(
                        columnSpacing: 10,
                        horizontalMargin: 20,
                        headingRowHeight: 52,
                        dataRowMinHeight: 62,
                        dataRowMaxHeight: 62,
                        headingRowColor: WidgetStateProperty.all(
                          Colors.grey.shade100,
                        ),
                        columns: [
                          DataColumn(
                            label: SizedBox(
                              width: w * .15,
                              child: const Text(
                                "Booking ID",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ),
                          ),

                          DataColumn(
                            label: SizedBox(
                              width: w * .18,
                              child: const Text(
                                "Customer",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ),
                          ),

                          DataColumn(
                            label: SizedBox(
                              width: w * .18,
                              child: const Text(
                                "Service",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ),
                          ),

                          DataColumn(
                            label: SizedBox(
                              width: w * .20,
                              child: const Text(
                                "Date & Time",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ),
                          ),

                          DataColumn(
                            label: SizedBox(
                              width: w * .10,
                              child: const Text(
                                "Amount",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ),
                          ),

                          DataColumn(
                            label: SizedBox(
                              width: w * .15,
                              child: const Text(
                                "Status",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ),
                          ),
                        ],

                        rows: bookings.map((booking) {
                          return DataRow(
                            cells: [
                              DataCell(
                                SizedBox(
                                  width: w * .10,
                                  child: Text(
                                    booking.id,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF64748B),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),

                              DataCell(
                                SizedBox(
                                  width: w * .18,
                                  child: Text(
                                    booking.customer,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),

                              DataCell(
                                SizedBox(
                                  width: w * .15,
                                  child: Text(
                                    booking.service,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF64748B),
                                    ),
                                  ),
                                ),
                              ),

                              DataCell(
                                SizedBox(
                                  width: w * .20,
                                  child: Text(
                                    booking.dateTime,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF64748B),
                                    ),
                                  ),
                                ),
                              ),

                              DataCell(
                                SizedBox(
                                  width: w * .11,
                                  child: Text(
                                    booking.amount,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),

                              DataCell(
                                SizedBox(
                                  width: w * .18,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: StatusBadge(status: booking.status),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Top Customers",
                          style: TextStyle(
                            fontSize: 18,
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
                                  color: Colors.blue.shade700,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(
                                Icons.chevron_right,
                                size: 18,
                                color: Colors.blue.shade700,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Divider(height: 1),

                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: customers.length,

                    itemBuilder: (context, index) {
                      return CustomerTile(customer: customers[index]);
                    },

                    separatorBuilder: (context, index) {
                      return const Divider(height: 1, color: Color(0xFFE2E8F0));
                    },
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

void _showAddBookingDialog(BuildContext context) {
   // ignore: unused_local_variable
   final amountController = TextEditingController(text: "1200");
  // ignore: unused_local_variable
  final notesController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) => const AddBookingDialog(),
  );
}
