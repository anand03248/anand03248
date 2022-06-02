package com.example.librarymanagement.controller;

import com.example.librarymanagement.entity.User;
import com.example.librarymanagement.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("/users")
	public String getUsers(ModelMap userModel) {
		List<User> users = userService.getUsers();
		System.out.println(users);
		userModel.addAttribute("users", users);
		return "users";
	}


	@GetMapping("/user/{id}")
	public String getUser(@PathVariable int id, ModelMap userModel) {
		User user = userService.getUser(id);
		userModel.addAttribute("user", user);
		return "user";
	}

	@GetMapping("addUser")
	public String addPage() {
		return "add";
	}

	@PostMapping("/add/user")
	public String addUser(@RequestParam(value = "username", required = true) String username,
						  @RequestParam(value = "password", required = true) String password,
						  @RequestParam(value = "name", required = true) String name,
							 @RequestParam(value = "email", required = true) String email, ModelMap userModel) {
		User user = new User();
		user.setName(name);
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		userService.addUser(user);
		userModel.addAttribute("msg", "User added successfully");
		List<User> users = userService.getUsers();
		userModel.addAttribute("users", users);
		return "redirect:/users";
	}

	@GetMapping("update/user/{id}")
	public String updatePage(@PathVariable("id") int id, ModelMap userModel) {
		userModel.addAttribute("id", id);
		User user = userService.getUser(id);
		userModel.addAttribute("user", user);
		return "update";
	}

	@PostMapping("/update/user")
	public String updateUser(@RequestParam String username,
							 @RequestParam String password,
							 @RequestParam int id,
							 @RequestParam(value = "name", required = true) String name,
							 @RequestParam(value = "email", required = true) String email, ModelMap userModel) {
		User user= new User(id,name,username,password, email);
		userService.updateUser(user);
		List<User> users = userService.getUsers();
		userModel.addAttribute("users", users);
		userModel.addAttribute("id", id);
		userModel.addAttribute("msg", "User updated successfully");
		return "redirect:/users";
	}

	@GetMapping("/delete/user/{id}")
	public String deleteUser(@PathVariable int id, ModelMap userModel) {
		userService.deleteUser(id);
		List<User> users = userService.getUsers();
		userModel.addAttribute("users", users);
		userModel.addAttribute("msg", "User delted successfully");
		return "redirect:/users";
	}
}
