package com.cell.user.web.exception.user;

public class UserNotExistsException extends UserException {

	private static final long serialVersionUID = 1087401379355122913L;

	public UserNotExistsException() {
		super("user.not.exists", null);
	}
}
