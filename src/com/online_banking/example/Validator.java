package com.online_banking.example;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validator {
	
	/**
	 * @desc the name must consists of alphabetic characters at least 2 chars  and at most 20 chars in length
	 * @param Strint name
	 * @return boolean
	 */
	public static boolean validateName(String name) {
		return validateRegExp("[a-zA-Z]{2,20}", name , 2 , 20);
	}

	/**
	 * @desc the username must consists of alphanumeric characters at least 4 chars and at most 20 chars in length 
	 * @param Strint username
	 * @return boolean
	 */
	public static boolean validateUsername(String username) {
		return validateRegExp("^[a-zA-z_-]+[\\w]*$", username,4,20);
	}

	/**
	 * @desc the password must consists of (alphabetic , _ or - ) and numeric characters at least 8 chars and at most 30 chars in length
	 * @param Strint password
	 * @return boolean
	 */
	public static boolean validatePassword(String password) {
		return validateRegExp("^(?:[a-zA-Z_-]+[0-9]+[\\w]*)$", password , 8 , 30);
	}

	/**
	 * @desc the password must matches  a given confPassword
	 * @param Strint password
	 * @param Strint confPassword
	 * @return boolean
	 */
	public static boolean validateMatchedPasswords(String password,
			String confPassword) {
		return password.equals(confPassword);
	}

	/**
	 * @desc the email must matches a valid email standard
	 * @param Strint email
	 * @return boolean
	 */
	public static boolean validateEmail(String email) {
		return validateRegExp("^[a-zA-z_-]+[\\([\\w-\\.]+)@((?:[\\w]+\\.)+)([a-zA-Z]{2,4})w]*$", email,4,100);
	}

	/**
	 * @desc the zipCode must consists of numeric characters or dashes at least 5 chars and at most 16 chars in length
	 * @param Strint zipCode
	 * @return boolean
	 */
	public static boolean validateZipcode(String zipCode) {
		return validateRegExp("(?:[0-9]{5,8}[-]*)+", zipCode,5,16);
	}

	/**
	 * @desc the nationalId must consists of numeric characters at least 14 chars and at most 14 chars in length
	 * @param Strint nationalId
	 * @return boolean
	 */
	public static boolean validateNationalId(String nationalId) {
		return validateRegExp("[0-9]{14}", nationalId,14,14);
	}

	/**
	 * @desc the cardNumber must consists of numeric characters at least 16 chars and at most 16 chars in length
	 * @param Strint cardNumber
	 * @return boolean
	 */
	public static boolean validateCardNumber(String cardNumber) {
		return validateRegExp("[0-9]{16}", cardNumber,16,16);
	}

	/**
	 * @desc the balance must consists of numeric characters
	 * @param Strint balance
	 * @return boolean
	 */
	public static boolean validateBalance(String balance) {
		return validateRegExp("[0-9]+", balance,1,20);
	}

	/**
	 * @desc the fax must consists of numeric characters at least 11 chars and at most 30 chars in length
	 * @param Strint fax
	 * @return boolean
	 */
	public static boolean validateFaxOrTelephone(String faxOrTelephone) {
		return validateRegExp("^((([0-9]{1})*[- .(]*([0-9]{3})[- .)]*[0-9]{3}[- .]*[0-9]{4})+)*$", faxOrTelephone , 11,30);
	}

	private static boolean validateRegExp(String regexp, String value , int low , int max) {
		Pattern pattern = Pattern.compile(regexp);
		Matcher matcher = pattern.matcher(value);
		if (matcher.matches() && value.length() >= low && value.length() <= max) {
			return true;
		} else {
			return false;
		}
	}

}
