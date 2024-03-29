import 'package:flutter/material.dart';

void main() {
  runApp(OrderApp());
}

class OrderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Screen',
      home: OrderScreen(),
    );
  }
}

class OrderScreen extends StatelessWidget {
  final List<OrderItem> orderItems = [
    OrderItem('Item 1', 10),
    OrderItem('Item 2', 15),
    OrderItem('Item 3', 20),
    OrderItem('Item 4', 25),
    OrderItem('Item 5', 30),
    OrderItem('Item 6', 35),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Screen'),
      ),
      body: 
        
         GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 10.0, // Spacing between columns
            mainAxisSpacing: 10.0, // Spacing between rows
        ),
           itemCount: orderItems.length,
           itemBuilder: (BuildContext context, int index) {
              return OrderItemCard(orderItems[index]);
        },
      ),
     
    );
  }
}

class OrderItem {
  final String name;
  final double price;

  OrderItem(this.name, this.price);
}

class OrderItemCard extends StatelessWidget {
  final OrderItem item;

  OrderItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(
              item.name,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              '\$${item.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            
          ],
        ),
      ),
    );
  }
}
