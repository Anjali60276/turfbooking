import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tufbooking/models/book_model.dart';

class CustomerCard extends StatelessWidget {
  final Customer customer;

  const CustomerCard({
    super.key,
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Card(
         
            elevation: 0,
            shadowColor: Colors.blueGrey,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
             child: Padding(padding: const EdgeInsets.all(18),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, //step one root is column and row must be come
                children: [
                  //Lets create an Header
                  Row(
                    children: [
                       
                       //First need to create an circle avatar
                        CircleAvatar(
                           radius: 24,
                           backgroundColor: const Color(0xFFDBEAFE),
                           child: Text(customer.name[0],
                             style: GoogleFonts.inter(
                              
                              fontWeight: FontWeight.bold,
                              color:Colors.blue,
                             ),
                           ),
                        ),
                       const SizedBox(width:12),
                        
                         Expanded(
                           child: Column(
                              mainAxisSize: MainAxisSize.min, // here  inside the row text need to be arranged vertically so inside the row we need to create an column with expanded because need space between
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              
                              Text(customer.name,
                               style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                               ),
                              ),
                              
                              const SizedBox(height: 3),
                              
                              Text(customer.id,
                              style: GoogleFonts.inter(
                                 fontSize: 12,
                                 fontWeight: FontWeight.w500,
                                 color:Colors.blueGrey,
                              ),
                              ),
                              
                              const SizedBox(height: 3),
                              
                              
                            ],
                           ), 
                         ), 
                         
                         Align(
                                alignment: Alignment.centerLeft,
                                 child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFEEF2FF),
                                      borderRadius: BorderRadius.circular(20),    
                                    ),
                                    
                                   child:Text(
                                     "${customer.bookings} Bookings",
                                       style: GoogleFonts.inter(
                                        color: Colors.indigo,
                                         fontWeight: FontWeight.w500,
                                         fontSize: 16,
                                       ),       
                                   ),    
                                 ),
                               ), 
                  ],
                  ),
                    const SizedBox(height: 10),
                            
                           infoRow(Icons.email_outlined, customer.email),
                           
                           const SizedBox(height: 10),
                           
                           infoRow(Icons.local_phone_outlined, customer.phone),
                           
                            const SizedBox(height: 10),
                            
                            infoRow(Icons.location_on_outlined, customer.address),
                            
                            const SizedBox(height: 10),
                            
                              infoRow(Icons.calendar_today_outlined, customer.joinedDate),
                           
                           
                              const SizedBox(height:25),
                           
                           SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(onPressed: () {
                              
                            }, icon:  const Icon(Icons.calendar_month_outlined),
                            label: const Text("View Booking"), ),
                           ),
               ],
               
               ),
             ),
        ),
    );
  
  }
}

Widget infoRow (IconData icon, String text) {
  return Row(
    children: [
     
        Icon(
          icon,
          size: 18,
          color: Colors.grey,
        ),
        
        const SizedBox(width:10),
        
        Flexible(child: Text(
          text, 
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.blueGrey,
            
           ),
        ),
        ),
        
  ],
  );
  

}
