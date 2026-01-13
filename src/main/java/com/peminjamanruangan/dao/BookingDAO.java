// BookingDAO.java (Interface)
package com.peminjamanruangan.dao;

import com.peminjamanruangan.model.Booking;
import java.util.List;

public interface BookingDAO {

    void addBooking(Booking booking);

    List<Booking> getBookingsByUser(int userId);
    // Tambahkan update status, dll.
}
