<<<<<<< HEAD:src/main/java/com/kh/naturephone/message/model/vo/MessgePageInfo.java
package com.kh.naturephone.message.model.vo;

import java.sql.Date;
=======
package com.kh.naturephone.common;
>>>>>>> c78903c143e51903577b3369b6881a2f926e9336:src/main/java/com/kh/naturephone/common/PageInfo.java

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MessgePageInfo {
	private int currentPage;
	private int listCount;
	private int pageLimit;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int messageLimit;
}
