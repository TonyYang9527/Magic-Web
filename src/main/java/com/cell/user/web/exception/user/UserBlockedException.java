package com.cell.user.web.exception.user;

public class UserBlockedException extends UserException {

	private static final long serialVersionUID = -3268732066526099207L;

	public UserBlockedException(String reason) {
		super("user.blocked", new Object[] { reason });
	}
}
