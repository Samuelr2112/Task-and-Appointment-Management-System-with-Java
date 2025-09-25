package com.samuel.appointments.apptaskmanager;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/tasks")
public class TaskController {

    private final TaskService taskService;

    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }

    @GetMapping("/{id}")
    public Task get(@PathVariable String id) {
        return taskService.getTask(id);
    }

    @PostMapping
    public void add(@RequestBody Task task) {
        taskService.addTask(task);
    }

    @PutMapping("/{id}/name")
    public void updateName(@PathVariable String id, @RequestParam String name) {
        taskService.updateTaskName(id, name);
    }

    @PutMapping("/{id}/description")
    public void updateDescription(@PathVariable String id, @RequestParam String description) {
        taskService.updateTaskDescription(id, description);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable String id) {
        taskService.deleteTask(id);
    }
}
