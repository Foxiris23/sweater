package com.example.greeting.controller;

import com.example.greeting.domain.Role;
import com.example.greeting.domain.User;
import com.example.greeting.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;


    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userService.findAll());
        return "userList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{username}")
    public String userEditForm(@PathVariable String username, Model model) {
        User user = userService.findByUsername(username);
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam String name
    ) {
        User user = userService.findByUsername(name);
        userService.saveUser(user, username, form);
        return "redirect:/user";
    }

    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());
        return "profile";
    }

    @PostMapping("profile")
    public String updateProfile(
            @AuthenticationPrincipal User user,
            @RequestParam String password,
            @RequestParam String passwordConfirm,
            @RequestParam String email,
            Model model
    ) {
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());

        if (password != null && !password.equals(passwordConfirm)) {
            model.addAttribute("error", "Passwords dont match");
            return "profile";
        }

        userService.updateProfile(user, password, email);
        model.addAttribute("message", "Information changed successfully!");
        return "profile";
    }

    @GetMapping("subscribe/{userId}")
    public String subscribe(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long userId
    ) {
        User user= userService.findById(userId);
        userService.subscribe(currentUser, user);
        return "redirect:/user-messages/" + user.getId();
    }

    @GetMapping("unsubscribe/{userId}")
    public String unsubscribe(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long userId
    ) {
        User user= userService.findById(userId);
        userService.unsubscribe(currentUser, user);
        return "redirect:/user-messages/" + user.getId();
    }

    @GetMapping("{type}/{user}/list")
    public String userList(
            Model model,
            @PathVariable("user") Long userId,
            @PathVariable String type
    ){
        User user=userService.findById(userId);
        model.addAttribute("userChannel", user);
        model.addAttribute("type", type);

        if("subscriptions".equals(type)){
            model.addAttribute("users", user.getSubscriptions());
        }else{
            model.addAttribute("users", user.getSubscribers());
        }

        return "subsriptions";
    }
}
