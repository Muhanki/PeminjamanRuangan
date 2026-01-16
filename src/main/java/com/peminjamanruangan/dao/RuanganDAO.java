package com.peminjamanruangan.dao;

import com.peminjamanruangan.model.Ruangan;
import java.util.List;


public interface RuanganDAO {
    List<Ruangan> getAllRuangan();
    void addRuangan(Ruangan ruangan);
    void updateRuangan(Ruangan ruangan);
    void deleteRuangan(int idRuangan);
    Ruangan getRuanganById(int idRuangan);
}
