package com.panda.paymentvo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class PurchaseListVO {
	private List<PurchaseVO> purchase;
}
