package com.kh.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class VerifyController {
	
	private final IamportClient iamportClient;
	
	public VerifyController() {
		this.iamportClient = new IamportClient("3385523672212016", "0m7UkEbjRD4PRxa5enpYpRuOkd85Z8JzIAQdJohfJuOHWysSUg4HnbzWjMx5ZKvqaDNKObB9EUOI9wxG");
	}
	
	@ResponseBody
	@RequestMapping("/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(Model model,
													Locale locale,
													HttpSession session,
													@PathVariable(value="imp_uid") String imp_uid) throws IamportResponseException, IOException{
		return iamportClient.paymentByImpUid(imp_uid);
	}
	
	

	
	
}
