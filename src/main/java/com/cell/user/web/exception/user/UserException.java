package com.cell.user.web.exception.user;

import com.cell.user.web.common.utils.exception.BaseException;

public class UserException extends BaseException {

	private static final long serialVersionUID = 236585828451900154L;

	public UserException(String code, Object[] args) {
		super("user", code, args, null);
	}

}
