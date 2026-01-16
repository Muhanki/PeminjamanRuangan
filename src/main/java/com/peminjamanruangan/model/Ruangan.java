package com.peminjamanruangan.model;

public class Ruangan {
    private int idRuangan;
    private String namaRuangan;
    private int kapasitas;
    private String keterangan;

    // Constructor, Getter, dan Setter
    public Ruangan() {}

    public int getIdRuangan() { return idRuangan; }
    public void setIdRuangan(int idRuangan) { this.idRuangan = idRuangan; }
    public String getNamaRuangan() { return namaRuangan; }
    public void setNamaRuangan(String namaRuangan) { this.namaRuangan = namaRuangan; }
    public int getKapasitas() { return kapasitas; }
    public void setKapasitas(int kapasitas) { this.kapasitas = kapasitas; }
    public String getKeterangan() { return keterangan; }
    public void setKeterangan(String keterangan) { this.keterangan = keterangan; }
}
