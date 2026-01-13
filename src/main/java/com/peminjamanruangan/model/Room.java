// Room.java
package com.peminjamanruangan.model;

public class Room {
    private int id;
    private String name;
    private int capacity;
    private String facilities;

    // Constructors, getters, setters
    public Room() {}
    public Room(int id, String name, int capacity, String facilities) {
        this.id = id;
        this.name = name;
        this.capacity = capacity;
        this.facilities = facilities;
    }
    // Getters and setters...
}