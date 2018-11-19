package com.taovr.services.business.util;

import java.io.FileWriter;
import java.io.IOException;

import org.xson.tangyuan.executor.monitor.MonitorWriter;

public class MyWriter implements MonitorWriter {

	private FileWriter	logWriter	= null;

	public void init() {
		try {
			// logWriter = new FileWriter("D:/a.log", true);
			logWriter = new FileWriter("/tmp/service.log", true);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void close() {
		if (null != logWriter) {
			try {
				logWriter.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void writer(StringBuilder builder) {
		if (null != logWriter) {
			try {
				logWriter.write(builder.toString());
				logWriter.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
