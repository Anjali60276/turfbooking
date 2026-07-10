import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingsPages extends StatefulWidget {
  const BookingsPages({super.key});
  @override
  State<BookingsPages> createState() => _BookingsPagesState();
}
  class _BookingsPagesState extends State<BookingsPages> {

  int selectedIndex = 0; //because of filtering we need the statefull widget in flutter because its cvalue change right

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  toolbarHeight: 75,
  backgroundColor: Colors.white,
  elevation: 0,
  scrolledUnderElevation: 0,
  surfaceTintColor: Colors.white,
  bottom: PreferredSize(
    preferredSize: const Size.fromHeight(1),
    child: Container(
      height: 1,
      color: const Color(0xFFE2E8F0),
    ),
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
              style: GoogleFonts.inter( // after style:  Add this okay
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF0F172A),
              ),
            ),
           
            const SizedBox(height: 2, width :2),
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




     const  SizedBox(width: 25),
      // Search Box
      Container(
        width: 220,
        height: 32,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: const Color(0xFFD6E0F5),
          ),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: "Search bookings...",
            hintStyle: TextStyle(
              fontSize: 14,
              color: Color(0xFF94A3B8),
            ),
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
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 10,
          ),
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
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 child:
                 Expanded(
                   child: Row(
                    children: [
                    FilterChip(
  label: Text(
    "All 6",
    style: TextStyle(
      color: selectedIndex == 0
          ? Colors.white
          : const Color(0xFF64748B),
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
  ),

  selected: selectedIndex == 0,

  onSelected: (_) {
    setState(() {
      selectedIndex = 0;
    });
  },

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
    "Confirmed  3",
    style: TextStyle(
      color: selectedIndex == 1
          ? Colors.white
          : const Color(0xFF64748B),
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
  ),

  selected: selectedIndex == 1,

  onSelected: (_) {
    setState(() {
      selectedIndex = 1;
    });
  },

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

   const SizedBox(width: 12),           //1
   
      FilterChip(
  label: Text(
    "Pending  2",
    style: TextStyle(
      color: selectedIndex == 2
          ? Colors.white
          : const Color(0xFF64748B),
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
  ),

  selected: selectedIndex == 2,

  onSelected: (_) {
    setState(() {
      selectedIndex = 2;
    });
  },

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

const SizedBox(width: 12),  //2

    


    FilterChip(
  label: Text(
    "Cancelled  1",
    style: TextStyle(
      color: selectedIndex == 4
          ? Colors.white
          : const Color(0xFF64748B),
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
  ),

  selected: selectedIndex == 4,

  onSelected: (_) {
    setState(() {
      selectedIndex = 4;
    });
  },

  showCheckmark: false,

  backgroundColor: Colors.white,

  selectedColor: const Color(0xFF2563EB),

  side: BorderSide(
    color: selectedIndex == 4
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

const SizedBox(width: 12),


   
   
       
                    
                    
                    
                    
                   ],),
                 )
                  
                
               ),
             )
          
         ],)
   )
  
 
      
      
      
     
      
    );
  }
}