package com.panda.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.panda.service.ChatService;

@RequestMapping("/chat")
@RestController
public class ChatRestController {
	
	@Inject
	ChatService service;
	
	@GetMapping(value="/getRooms/{id}", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List getRooms(@PathVariable("id") String id) throws Exception{
		
		return service.getRooms(id);
	}
	
}
