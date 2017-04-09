package com.cell.user.web.exception.user;

public class UserPasswordNotMatchException extends UserException {

	private static final long serialVersionUID = 6085718707813200775L;

	public UserPasswordNotMatchException() {
		super("user.password.not.match", null);
	}
}
