import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tufbooking/components/dashboard_cards.dart';



class DashboardPages extends StatelessWidget {
  const DashboardPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor:  Color(0xFFF1F5F9),
          appBar: AppBar(
  backgroundColor: Colors.white,
  elevation: 0,
  toolbarHeight: 60,
  

  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      // Left Side
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),


     const SizedBox(width: 20),
      // Right Side
      ElevatedButton.icon(
        onPressed: () {},

        icon: const Icon(
          Icons.add,
          size: 16,
          color: Colors.white,
        ),

        label: const Text(
          "New Booking",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),

        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1D4ED8),
           minimumSize: const Size(120, 40),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
            
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    ],
  ),
),
          
          body: SafeArea(
            child:SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                 Expanded(
                  child: DashboardCards(
                    title: 'TOTAL BOOKINGS',
                     value: '6', 
                     subtitle: '3 confirmed',
                      icon:Icons.assignment_outlined, 
                      iconColor:Color(0xFF2563EB),
                       iconBg: Color(0xFFEFF6FF),
                        ),
                  ),
                  SizedBox(width: 16),
                  
                   Expanded(
                  child: DashboardCards(
                   title: 'ACTIVE CUSTOMERS',
            value: '5',
            subtitle: 'registered members',
            icon: Icons.people_outline,
            iconColor: Color(0xFF4F46E5),
            iconBg: Color(0xFFEEF2FF),
                        ),
                  ),
                  
                      SizedBox(width: 16),
                      
                            Expanded(
                  child: DashboardCards(
                   title: 'PENDING',
            value: '2',
            subtitle: 'awaiting confirmation',
            icon: Icons.error_outline,
            iconColor: Color(0xFFD97706),
            iconBg: Color(0xFFFEF3C7),
                        ),
                  ),
                  
                  SizedBox(width: 16),
                  
                  Expanded(
                  child: DashboardCards(
                   title: 'REVENUE',
            value: '₹5,400',
            subtitle: 'from confirmed bookings',
            icon: Icons.trending_up,
            iconColor: Color(0xFF16A34A),
            iconBg: Color(0xFFDCFCE7),
                        ),
                  ),
                  
                  
                  
                ],
              ) 
            ) ),
          
    
    );
  }
}