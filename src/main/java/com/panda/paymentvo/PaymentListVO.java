package com.panda.paymentvo;

import java.util.List;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class PaymentListVO {
	private PaymentDto paymentDto;
	private List<PaymentDetailDto> paymentDetailList;
}
