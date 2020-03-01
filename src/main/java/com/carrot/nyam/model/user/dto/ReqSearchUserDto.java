package com.carrot.nyam.model.user.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReqSearchUserDto {
	private String username;
	private String profile;
	private String introduction;
}
