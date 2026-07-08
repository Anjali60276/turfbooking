import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class PrimaryScaffold extends StatelessWidget {
  final Widget body;
  final String currentLocation;

 const PrimaryScaffold({
  super.key, //here we used the super_parameters
    required this.body,
    required this.currentLocation, //for current pages
  }) ;

  @override
  Widget build(BuildContext context) {
    // The exact royal blue color from the image
    const Color sidebarBlue = Color(0xFF1E50E2); 

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Sidebar Container
          Container(
            width: 260,
            color: sidebarBlue,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Logo and Titles
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.calendar_today_outlined,
                          color: sidebarBlue,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'TUF Booking',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Sports & Turf',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  
                  
                  const Divider(color: Colors.white24, height: 1, endIndent: 5,),
                  
                  const SizedBox(height: 24),

                  // Sidebar Navigation Items
                  _SidebarItem(
                    icon: Icons.dashboard_outlined,
                    label: 'Dashboard',
                    isActive:  currentLocation == '/',
                    onTap: () => context.go('/'), // Active state
                  ),
                  
                  const SizedBox(height: 8),
                  _SidebarItem(
                    icon: Icons.assignment_outlined,
                    label: 'Bookings',
                    isActive: currentLocation == '/bookings',
                    onTap: () => context.go('/bookings'),
                  ),
                  const SizedBox(height: 8),
                  _SidebarItem(
                    icon: Icons.people_outline_rounded,
                    label: 'Customers',
                    isActive: currentLocation == '/customers',
                    onTap: () => context.go('/customers'),
                  ),

                  const Spacer(), // Pushes the cookie button to the bottom

                  // Footer Button
                  
                ],
              ),
            ),
          ),

          // Main Content View
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
 
 
  //Here SideBar items
class _SidebarItem extends StatelessWidget {
  final IconData icon; //Stores the icon that will be displayed.
  final String label; //  Stores the text shown beside the icon. e.g "Dashboards"
  final bool isActive; // Decides whether this menu item is currently selected. 
  
  // If true:
  //   - Background becomes black
  //   - Icon becomes blue
  //   - Text becomes blue
  //
  // If false:
  //   - Transparent background
  //   - White icon
  //   - White text
  //
  // Real-world example:
  // Imagine the navigation menu in YouTube.
  // When you're on Home, the Home icon is highlighted.
  // That's exactly what isActive does.
  
  final VoidCallback? onTap;  // Function that runs when the user clicks this menu item.
    // Real-world example:
  // Dashboard -> Navigate to Dashboard page.
  const _SidebarItem({  //This is used whenever a new sidebar item is created.
    required this.icon,  //every menu need an icon
    required this.label, // every menu need an title
    this.isActive = false, // meaning the item is not selected by default
    this.onTap,  // for navigating the page by context.go('/bookings')
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12,
         horizontal: 12
         ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isActive ? Colors.blue.shade800 : Colors.white,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: isActive ? Colors.blue.shade800 : Colors.white,
                  fontSize: 14,
                  fontWeight:  FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

