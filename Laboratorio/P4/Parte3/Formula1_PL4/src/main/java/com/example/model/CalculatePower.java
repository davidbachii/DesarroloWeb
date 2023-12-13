package com.example.model;

public class CalculatePower {
    public static int calculateTotalPower(Circuit circuit, Car car) {
        int totalPower = 0;
        int totalCurves = circuit.getLaps() * circuit.getCurves();
        totalPower = totalCurves * car.getPowerPerCurve();
        return totalPower;
    }
}

