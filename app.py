import mysql.connector

connection = mysql.connector.connect(
    host='localhost',
    user='root',
    password='Root',
    database='LittleLemon'
)
cursor = connection.cursor()

def GetMaxQuantity():
    cursor.execute("SELECT MAX(Quantity) FROM Orders;")
    result = cursor.fetchone()
    print("Max Quantity:", result[0])

def ManageBooking(action, booking_id=None):
    if action == "view":
        cursor.execute("SELECT * FROM Bookings;")
        for row in cursor.fetchall():
            print(row)
    elif action == "delete" and booking_id:
        cursor.execute("DELETE FROM Bookings WHERE BookingID = %s", (booking_id,))
        connection.commit()

def UpdateBooking(booking_id, new_date):
    cursor.execute("UPDATE Bookings SET BookingDate = %s WHERE BookingID = %s", (new_date, booking_id))
    connection.commit()

def AddBooking(booking_id, customer_id, date):
    cursor.execute("INSERT INTO Bookings (BookingID, CustomerID, BookingDate) VALUES (%s, %s, %s)", 
                   (booking_id, customer_id, date))
    connection.commit()

def CancelBooking(booking_id):
    cursor.execute("DELETE FROM Bookings WHERE BookingID = %s", (booking_id,))
    connection.commit()

cursor.close()
connection.close()
