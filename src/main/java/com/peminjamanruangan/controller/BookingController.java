package com.peminjamanruangan.controller;

import com.peminjamanruangan.dao.BookingDAO;
import com.peminjamanruangan.dao.BookingDAOImpl;
import com.peminjamanruangan.model.Booking;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import jakarta.servlet.ServletException;  // Ganti dari javax ke jakarta
import jakarta.servlet.annotation.WebServlet;  // Ganti dari javax ke jakarta
import jakarta.servlet.http.HttpServlet;  // Ganti dari javax ke jakarta
import jakarta.servlet.http.HttpServletRequest;  // Ganti dari javax ke jakarta
import jakarta.servlet.http.HttpServletResponse;  // Ganti dari javax ke jakarta
import jakarta.servlet.http.HttpSession;  // Ganti dari javax ke jakarta

@WebServlet("/booking")
public class BookingController extends HttpServlet {

    private BookingDAO bookingDAO = new BookingDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int roomId = Integer.parseInt(request.getParameter("ruangan").split(" ")[1]); // Parse dari dropdown
        Date date = Date.valueOf(request.getParameter("tanggal"));
        Time time = Time.valueOf(request.getParameter("waktu") + ":00");

        Booking booking = new Booking();
        booking.setUserId(userId);
        booking.setRoomId(roomId);
        booking.setDate(date);
        booking.setTime(time);
        booking.setStatus("Pending");

        bookingDAO.addBooking(booking);
        response.sendRedirect("statusPeminjaman.jsp");
    }
}
