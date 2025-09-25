package com.samuel.appointments.apptaskmanager;

import org.springframework.web.bind.annotation.*;
import java.util.Collection;

@RestController
@RequestMapping("/contacts")
public class ContactController {

    private final ContactService contactService;

    public ContactController(ContactService contactService) {
        this.contactService = contactService;
    }

    @GetMapping("/{id}")
    public Contact get(@PathVariable String id) {
        return contactService.getContact(id);
    }

    @PostMapping
    public boolean add(@RequestBody Contact contact) {
        return contactService.addContact(contact);
    }

    @PutMapping("/{id}")
    public boolean update(@PathVariable String id,
                          @RequestParam(required = false) String firstName,
                          @RequestParam(required = false) String lastName,
                          @RequestParam(required = false) String phone,
                          @RequestParam(required = false) String address) {
        return contactService.updateContact(id, firstName, lastName, phone, address);
    }

    @DeleteMapping("/{id}")
    public boolean delete(@PathVariable String id) {
        return contactService.deleteContact(id);
    }
}
