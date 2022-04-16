import 'package:flutter/material.dart';
import 'package:flutter_responsive_layout/flutter_responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpointsProvider(
      child: MaterialApp(
        title: "Responsive app",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: Colors.purpleAccent.withOpacity(0.15),
        ),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: ResponsivePage(),
        ),
      ),
    );
  }
}

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
      sm: const EdgeInsets.all(8),
      lg: const EdgeInsets.all(12),
      child: ResponsiveFlex(
        sm: const ResponsiveFlexData.vertical(),
        lg: const ResponsiveFlexData.horizontal(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
        children: [
          ResponsiveFlexible(
            lg: const ResponsiveExpandedData(),
            child: ResponsiveFlex(
              sm: const ResponsiveFlexData(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.stretch,
              ),
              lg: const ResponsiveFlexData(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.stretch,
              ),
              children: [
                const ColoredBox(
                  color: Colors.deepPurpleAccent,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Responsive app title",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ResponsiveSizedBox(
                  sm: const ResponsiveSizedBoxData(height: 16),
                  lg: const ResponsiveSizedBoxData(height: 20),
                ),
                for (int i = 0; i < 4; i++)
                  ResponsivePadding(
                    sm: const EdgeInsets.symmetric(vertical: 4),
                    lg: const EdgeInsets.symmetric(vertical: 8),
                    child: ColoredBox(
                      color: Colors.deepPurpleAccent.withOpacity(0.2),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Card title",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          ResponsiveSizedBox(
            sm: const ResponsiveSizedBoxData(height: 16),
            lg: const ResponsiveSizedBoxData(width: 12),
          ),
          ColoredBox(
            color: Colors.deepPurple.withOpacity(0.3),
            child: ResponsivePadding(
              sm: const EdgeInsets.all(12),
              lg: const EdgeInsets.all(20),
              child: ResponsiveFlex(
                sm: const ResponsiveFlexData.vertical(crossAxisAlignment: CrossAxisAlignment.stretch),
                lg: const ResponsiveFlexData.vertical(),
                children: const [
                  Text(
                    "Sidebar title",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}