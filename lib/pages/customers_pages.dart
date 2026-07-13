import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tufbooking/data/book_data.dart';
import 'package:tufbooking/components/Customer_cards.dart';
import 'package:tufbooking/models/book_model.dart';

class  CustomersPages extends StatelessWidget {
  const CustomersPages({super.key});

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
                    "Customers",
                    style: GoogleFonts.inter(
                      // after style:  Add this okay
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF0F172A),
                    ),
                  ),

                  const SizedBox(height: 2, width: 2),
                  Text(
                    "5 registered customer",
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
      
      
      body: Padding(
  padding: const EdgeInsets.all(20),
  child: GridView.builder(
    itemCount: customer.length,
    gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 1.35,
    ),
    itemBuilder: (context, index) {
      return CustomerCard(
        customer: customer[index],
      );
    },
  ),
),
    );
  }
}