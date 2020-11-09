package com.hk.saeyan.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hk.saeyan.dto.Asset;
import com.hk.saeyan.dto.MapData;
import com.hk.saeyan.dto.Product;
import com.hk.saeyan.dto.StatisticDay;
import com.hk.saeyan.service.AdminService;

import java.util.List;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@RestController
@RequestMapping(value="/admin/rest")
public class AdminRestController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRestController.class);
	
	@Autowired
	AdminService adminService;
	
	@GetMapping(path = "/map", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<MapData> mapLoad(Model model) {
		logger.info("/admin/rest/mapLoad ----------");
		System.out.println("<<여기는 AdminRestController>>"+"맵데이터 로딩중입니다.");
		return adminService.mapLoad();
	}
	
	@GetMapping(path = "/chartData", produces = MediaType.APPLICATION_JSON_VALUE)
	public JSONObject chartData(Model model,@RequestParam("snum") String snum,@RequestParam("pStart") String pStart,@RequestParam("pEnd") String pEnd) {
		logger.info("/admin/rest/mapLoad ----------");
		System.out.println("<<여기는 AdminRestController>>"+"맵데이터 로딩중입니다.");
		List<StatisticDay> sd = adminService.chartData(snum,pStart,pEnd);
		System.out.println(sd);
		JSONObject data = new JSONObject();
		JSONObject ajaxObjCols1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
		JSONObject ajaxObjCols2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
		JSONObject ajaxObjCols3 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
		JSONArray ajaxArryCols = new JSONArray(); 
		JSONArray ajaxArryRows = new JSONArray();
		
		ajaxObjCols1.put("id", "");
		ajaxObjCols1.put("label", "날짜");
		ajaxObjCols1.put("pattern", "");
		ajaxObjCols1.put("type", "string");
		 
		ajaxObjCols2.put("id", "");
		ajaxObjCols2.put("label", "판매량");
		ajaxObjCols2.put("pattern", "");
		ajaxObjCols2.put("type", "number");
		
		ajaxObjCols3.put("id", "");
		ajaxObjCols3.put("label", "판매금액");
		ajaxObjCols3.put("pattern", "");
		ajaxObjCols3.put("type", "number");
		
		ajaxArryCols.add(ajaxObjCols1);
		ajaxArryCols.add(ajaxObjCols2);
		ajaxArryCols.add(ajaxObjCols3);

		int size = sd.size();
		
		for (int i=0; i<size; i++){        //JSONArray의 size만큼 돌면서 형식을 만듭니다.
			StatisticDay ssd = sd.get(i);
//			System.out.println("날짜"+ssd.getCday());
			
		    JSONObject day = new JSONObject();
		    day.put("v", ssd.getCday());
		    day.put("f", null);
		    
		    JSONObject value1 = new JSONObject();
		    value1.put("v", ssd.getOp());
		    value1.put("f", null);
		 
		    JSONObject value2 = new JSONObject();
		    value2.put("v", ssd.getOq());
		    value2.put("f", null);
		    
		    JSONArray cValueArry = new JSONArray();
		    cValueArry.add(day);
		    cValueArry.add(value1);
		    cValueArry.add(value2);
		 
		    JSONObject cValueObj = new JSONObject();
		    cValueObj.put("c", cValueArry);
		 
		    ajaxArryRows.add(cValueObj);
		}
		
		data.put("cols", ajaxArryCols);
		data.put("rows", ajaxArryRows);

		System.out.println(data);
		return data;
	}
	
	@GetMapping(path = "/insertItem", produces = MediaType.APPLICATION_JSON_VALUE)
	public int insertItem(Model model,Product product) {
		logger.info("/admin/rest/insertItem ----------");
		System.out.println(product.toString());
		return adminService.insertItem(product);
	}
	@GetMapping(path = "/deleteItem", produces = MediaType.APPLICATION_JSON_VALUE)
	public int deleteItem(Model model,@RequestParam("pno") int pno) {
		logger.info("/admin/rest/deleteItem ----------");
		System.out.println("삭제 pno="+pno);
		return adminService.deleteItem(pno);
	}
	
	@GetMapping(path = "/assetAcheck", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Asset> assetAcheck(Model model) {
		logger.info("/admin/rest/assetAcheck ----------");
		System.out.println(adminService.assetAcheck());
		return adminService.assetAcheck();
	}
	
	@GetMapping(path = "/assetAcheckPost", produces = MediaType.APPLICATION_JSON_VALUE)
	public int assetAcheckPost(Model model,@RequestParam("asset_seq") String asset_seq,@RequestParam("a_check") String a_check) {
		logger.info("/admin/rest/assetAcheckPost ----------");
		System.out.println(adminService.assetAcheckPost(asset_seq,a_check));
		return adminService.assetAcheckPost(asset_seq,a_check);
	}
	
	
	
}