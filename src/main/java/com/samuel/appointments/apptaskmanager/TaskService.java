package com.samuel.appointments.apptaskmanager;

import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Service;


@Service
public class TaskService {
    private Map<String, Task> tasks;

    public TaskService() {
        tasks = new HashMap<>();
    }

    public void addTask(Task task) {
        if (tasks.containsKey(task.getTaskId())) {
            throw new IllegalArgumentException("Task ID already exists");
        }
        tasks.put(task.getTaskId(), task);
    }

    public void deleteTask(String taskId) {
        tasks.remove(taskId);
    }

    public void updateTaskName(String taskId, String name) {
        Task task = tasks.get(taskId);
        if (task != null) {
            task.setName(name);
        }
    }

    public void updateTaskDescription(String taskId, String description) {
        Task task = tasks.get(taskId);
        if (task != null) {
            task.setDescription(description);
        }
    }

    public Task getTask(String taskId) {
        return tasks.get(taskId);
    }
}
