package com.samuel.appointments.apptaskmanager;

import org.springframework.stereotype.Service;
import java.util.*;

@Service
public class AppointmentService {
    private final Map<String, Appointment> appointments;

    public AppointmentService() {
        appointments = new HashMap<>();
    }

    public List<Appointment> getAllAppointments() {
        return new ArrayList<>(appointments.values());
    }

    public Appointment addAppointment(Appointment appointment) {
        if (appointments.containsKey(appointment.getAppointmentID())) {
            throw new IllegalArgumentException("Appointment ID already exists");
        }
        appointments.put(appointment.getAppointmentID(), appointment);
        return appointment;
    }

    public void deleteAppointment(String appointmentID) {
        if (!appointments.containsKey(appointmentID)) {
            throw new IllegalArgumentException("Appointment ID does not exist");
        }
        appointments.remove(appointmentID);
    }

    public Appointment getAppointment(String appointmentID) {
        return appointments.get(appointmentID);
    }
}
