package com.taovr.core.web;

import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class AESUtil {

	/**
	 * 加密
	 * 
	 * @param content
	 *            待加密内容
	 * @param key
	 *            加密的密钥
	 * @return
	 */
	public static String encrypt(String content, String key) {
		try {
			KeyGenerator kgen = KeyGenerator.getInstance("AES");
			kgen.init(128, new SecureRandom(key.getBytes()));
			SecretKey secretKey = kgen.generateKey();
			byte[] enCodeFormat = secretKey.getEncoded();
			SecretKeySpec secretKeySpec = new SecretKeySpec(enCodeFormat, "AES");
			Cipher cipher = Cipher.getInstance("AES");
			byte[] byteContent = content.getBytes("utf-8");
			cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);
			byte[] byteRresult = cipher.doFinal(byteContent);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteRresult.length; i++) {
				String hex = Integer.toHexString(byteRresult[i] & 0xFF);
				if (hex.length() == 1) {
					hex = '0' + hex;
				}
				sb.append(hex.toUpperCase());
			}
			return sb.toString();
			// } catch (NoSuchAlgorithmException e) {
			// e.printStackTrace();
			// } catch (NoSuchPaddingException e) {
			// e.printStackTrace();
			// } catch (InvalidKeyException e) {
			// e.printStackTrace();
			// } catch (UnsupportedEncodingException e) {
			// e.printStackTrace();
			// } catch (IllegalBlockSizeException e) {
			// e.printStackTrace();
			// } catch (BadPaddingException e) {
			// e.printStackTrace();
			// }

		} catch (Throwable e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 解密
	 * 
	 * @param content
	 *            待解密内容
	 * @param key
	 *            解密的密钥
	 * @return
	 */
	public static String decrypt(String content, String key) {
		if (content.length() < 1)
			return null;
		byte[] byteRresult = new byte[content.length() / 2];
		for (int i = 0; i < content.length() / 2; i++) {
			int high = Integer.parseInt(content.substring(i * 2, i * 2 + 1), 16);
			int low = Integer.parseInt(content.substring(i * 2 + 1, i * 2 + 2), 16);
			byteRresult[i] = (byte) (high * 16 + low);
		}
		try {
			KeyGenerator kgen = KeyGenerator.getInstance("AES");
			kgen.init(128, new SecureRandom(key.getBytes()));
			SecretKey secretKey = kgen.generateKey();
			byte[] enCodeFormat = secretKey.getEncoded();
			SecretKeySpec secretKeySpec = new SecretKeySpec(enCodeFormat, "AES");
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.DECRYPT_MODE, secretKeySpec);
			byte[] result = cipher.doFinal(byteRresult);
			return new String(result);
			// } catch (NoSuchAlgorithmException e) {
			// e.printStackTrace();
			// } catch (NoSuchPaddingException e) {
			// e.printStackTrace();
			// } catch (InvalidKeyException e) {
			// e.printStackTrace();
			// } catch (IllegalBlockSizeException e) {
			// e.printStackTrace();
			// } catch (BadPaddingException e) {
			// e.printStackTrace();
			// }
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}
	}

	public static void main(String[] args) {
		// String content = "AEStest";
		// String content =
		// "<?xml version=\"1.0\" encoding=\"UTF-8\"?><X><L K=\"user_id\" V=\"10\"/><I K=\"nCount\" V=\"中国\"/></X>";

		String content = "24C2584138719D77C4FEBDE382D84648";
		String password = "1234567890";
		System.out.println("密　钥：" + password);
		System.out.println("加密前：" + content);
		// 加密
		String encryptResult = encrypt(content, password);
		System.out.println("加密后：" + encryptResult);
		// 解密
		String decryptResult = decrypt(encryptResult, password);
		System.out.println("解密后：" + decryptResult);
	}
}
