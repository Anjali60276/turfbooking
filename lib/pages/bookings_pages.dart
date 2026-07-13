import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tufbooking/components/status_badge.dart';
import 'package:tufbooking/data/dummy_data.dart';

class BookingsPages extends StatefulWidget {
  const BookingsPages({super.key});
  @override
  State<BookingsPages> createState() => _BookingsPagesState();
}

class _BookingsPagesState extends State<BookingsPages> {
  int selectedIndex = 0; //because of filtering we need the statefull widget in flutter because its cvalue change right
   final allBookings = dummy;

  late List filteredBookings;
  
  @override
void initState() {
  super.initState();

  filteredBookings = List.from(allBookings);
}

void filterBookings(int index) {
  setState(() {
    selectedIndex = index;

    switch (index) {
      case 0:
        filteredBookings = List.from(allBookings);
        break;

      case 1:
        filteredBookings = allBookings
            .where((booking) => booking.status == "Confirmed")
            .toList();
        break;

      case 2:
        filteredBookings = allBookings
            .where((booking) => booking.status == "Pending")
            .toList();
        break;

      case 3:
        filteredBookings = allBookings
            .where((booking) => booking.status == "Cancelled")
            .toList();    
        break;
    }
  });
}


 
  int get confirmedCount =>
    allBookings.where((e) => e.status == "Confirmed").length;

int get pendingCount =>
    allBookings.where((e) => e.status == "Pending").length;

int get cancelledCount =>
    allBookings.where((e) => e.status == "Cancelled").length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 0, color: const Color(0xFFE2E8F0)),
        ),
        title: Row(
          children: [
            // Left Side
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "All Bookings",
                    style: GoogleFonts.inter(
                      // after style:  Add this okay
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF0F172A),
                    ),
                  ),

                  const SizedBox(height: 2, width: 2),
                  Text(
                    "6 total bookings",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 25),
            // Search Box
            Container(
              width: 220,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFD6E0F5)),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search bookings...",
                  hintStyle: TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 29,
                    color: Color(0xFF64748B),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),

            /// this section how you create an search bar items  inside the container remebering
            ///
            const SizedBox(width: 16),

            // Add Booking Button
            SizedBox(
              height: 32,

              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.white, size: 10),
                label: Text(
                  "Add Booking",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  elevation: 2,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                child: Row(
                  children: [
                    FilterChip(
                      label: Text(
                        "All ${allBookings.length}",
                        style: TextStyle(
                          color: selectedIndex == 0
                              ? Colors.white
                              : const Color(0xFF64748B),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),

                      selected: selectedIndex == 0,

                    onSelected: (_) => filterBookings(0),

                      showCheckmark: false,

                      backgroundColor: Colors.white,

                      selectedColor: const Color(0xFF2563EB),

                      side: BorderSide(
                        color: selectedIndex == 0
                            ? const Color(0xFF2563EB)
                            : const Color(0xFFE2E8F0),
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),

                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),

                    // 0
                    const SizedBox(width: 12),

                    FilterChip(
                      label: Text(
                        "Confirmed $confirmedCount",
                        style: TextStyle(
                          color: selectedIndex == 1
                              ? Colors.white
                              : const Color(0xFF64748B),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),

                      selected: selectedIndex == 1,

                    onSelected: (_) => filterBookings(1),

                      showCheckmark: false,

                      backgroundColor: Colors.white,

                      selectedColor: const Color(0xFF2563EB),

                      side: BorderSide(
                        color: selectedIndex == 1
                            ? const Color(0xFF2563EB)
                            : const Color(0xFFE2E8F0),
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),

                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),

                    const SizedBox(width: 12), //1

                    FilterChip(
                      label: Text(
                        "Pending $pendingCount",
                        style: TextStyle(
                          color: selectedIndex == 2
                              ? Colors.white
                              : const Color(0xFF64748B),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),

                      selected: selectedIndex == 2,

                    onSelected: (_) => filterBookings(2),

                      showCheckmark: false,

                      backgroundColor: Colors.white,

                      selectedColor: const Color(0xFF2563EB),

                      side: BorderSide(
                        color: selectedIndex == 2
                            ? const Color(0xFF2563EB)
                            : const Color(0xFFE2E8F0),
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),

                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),

                    const SizedBox(width: 12), //2

                    FilterChip(
                      label: Text(
                        "Cancelled $cancelledCount",
                        style: TextStyle(
                          color: selectedIndex == 3
                              ? Colors.white
                              : const Color(0xFF64748B),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),

                      selected: selectedIndex == 3,

                     onSelected: (_) => filterBookings(3),

                      showCheckmark: false,

                      backgroundColor: Colors.white,

                      selectedColor: const Color(0xFF2563EB),

                      side: BorderSide(
                        color: selectedIndex == 3
                            ? const Color(0xFF2563EB)
                            : const Color(0xFFE2E8F0),
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),

                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ), // afterthis padding need to be added

            const SizedBox(height: 24),

            SingleChildScrollView(
                scrollDirection: Axis.vertical,
              child: Padding(
                //this will be optional
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 610,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
              
                  child: Column(
                    children: [
                         //HereAdd Data Table
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
              child: const Text("Booking ID",
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
              child: const Text("Customer",
              style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF64748B),
                    ),),
                        ),
                      ),
              
                      DataColumn(
                        label: SizedBox(
              width: w * .18,
              child: const Text("Service",
              style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF64748B),
                    ),),
                        ),
                      ),
              
                      DataColumn(
                        label: SizedBox(
              width: w * .20,
              child: const Text("Date & Time",
              style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF64748B),
                    ),),
                        ),
                      ),
              
                      DataColumn(
                        label: SizedBox(
              width: w * .10,
              child: const Text("Amount",
              style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF64748B),
                    ),),
                        ),
                      ),
              
                      DataColumn(
                        label: SizedBox(
              width: w * .15,
              child: const Text("Status",
              style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF64748B),
                    ),),
                        ),
                      ),
                    ],
              
                   rows: filteredBookings.map((booking) {
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
                        width: w * .12,
                        child: Align(
              alignment: Alignment.centerLeft,
              child: StatusBadge(
                status: booking.status,
              ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
                  );
                },
              ),
                       const Divider(
  height: 1,
  color: Color(0xFFE2E8F0),
),

Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 18,
    vertical: 10,
  ),
  child: Row(
    children: [

      Text(
        "Showing ${filteredBookings.length} of ${allBookings.length} bookings",
        style: GoogleFonts.inter(
          fontSize: 13,
          color: const Color(0xFF64748B),
          fontWeight: FontWeight.w500,
        ),
      ),

      const Spacer(),

      Text(
        "${allBookings.length} total bookings",
        style: GoogleFonts.inter(
          fontSize: 13,
          color: const Color(0xFF64748B),
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  ),
),
                       
                                             
                    ],
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
