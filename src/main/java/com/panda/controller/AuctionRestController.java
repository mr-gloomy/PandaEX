package com.panda.controller;

import java.util.*;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.panda.domain.AuctionVO;
import com.panda.persistence.AuctionDAOImpl;
import com.panda.service.AuctionService;

import lombok.extern.log4j.Log4j;

@RequestMapping("/auctions")
@RestController
public class AuctionRestController {
	
	private static final Logger mylog = LoggerFactory.getLogger(AuctionDAOImpl.class);
	
	@Inject
	AuctionService service;
	
	@GetMapping("/refreshP/{a_no}")
	public AuctionVO getList(@PathVariable int a_no) throws Exception{
		mylog.info("list 카테고리 호출 ");
		return service.getAuction(a_no);
	}
	
}
