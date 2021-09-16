package day01;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@ToString
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyUser {
	//필드(또는 프로퍼티, 속성)
	private String name;
	private int age;
	private String location;
}
