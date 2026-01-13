// RoomDAO.java (Interface)
package com.peminjamanruangan.dao;

import com.peminjamanruangan.model.Room;
import java.util.List;

public interface RoomDAO {
    List<Room> getAllRooms();
    Room getRoomById(int id);
    // Tambahkan CRUD lainnya jika perlu
}
