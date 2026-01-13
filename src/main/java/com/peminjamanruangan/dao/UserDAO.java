// UserDAO.java (Interface)
package com.peminjamanruangan.dao;

import com.peminjamanruangan.model.User;
import java.util.List;

public interface UserDAO {

    void addUser(User user);

    User getUserByUsername(String username);

    List<User> getAllUsers();

    void updateUser(User user);

    void deleteUser(int id);
}
