package com.panda.paymentvo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class AmountVO {
	private int total, tax_free, vat, point, discount;
}
