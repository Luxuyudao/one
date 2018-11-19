package com.taovr.web.user;

import java.awt.Color;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.patchca.color.ColorFactory;
import org.patchca.color.SingleColorFactory;
import org.patchca.filter.predefined.WobbleRippleFilterFactory;
import org.patchca.font.RandomFontFactory;
import org.patchca.service.Captcha;
import org.patchca.service.CaptchaService;
import org.patchca.service.ConfigurableCaptchaService;
import org.patchca.word.RandomWordFactory;

public class CaptchaServiceFactory {

	// private static final String DEFAULT_CHARACTERS = "123456789";
	private static final String	DEFAULT_CHARACTERS	= "123456789abcdefghkmnpqstwxyz";

	private static int			DEFAULT_FONT_SIZE	= 25;

	private static int			DEFAULT_WORD_LENGTH	= 4;
	// private static int DEFAULT_WORD_LENGTH = 6;

	// private static int DEFAULT_WIDTH = 80;
	private static int			DEFAULT_WIDTH		= 120;

	private static int			DEFAULT_HEIGHT		= 35;

	private CaptchaServiceFactory() {

	}

	public static CaptchaService create(int fontSize, int wordLength, String characters, int width, int height) {

		ConfigurableCaptchaService service = null;
		// 字体大小设置
		RandomFontFactory ff = new RandomFontFactory();
		ff.setMinSize(fontSize);
		ff.setMaxSize(fontSize);
		// ff.setFamilies(families);

		// 生成的单词设置
		RandomWordFactory rwf = new RandomWordFactory();
		rwf.setCharacters(characters);
		rwf.setMinLength(wordLength);
		rwf.setMaxLength(wordLength);

		// 干扰线波纹
		// CurvesRippleFilterFactory filter = new CurvesRippleFilterFactory();
		// MarbleRippleFilterFactory filter = new MarbleRippleFilterFactory();
		// DoubleRippleFilterFactory filter = new DoubleRippleFilterFactory();
		WobbleRippleFilterFactory filter = new WobbleRippleFilterFactory();
		// DiffuseRippleFilterFactory filter = new DiffuseRippleFilterFactory();

		// 处理器
		service = new ExConfigurableCaptchaService();
		service.setFontFactory(ff);
		service.setWordFactory(rwf);
		service.setFilterFactory(filter);

		// 生成图片大小（像素）
		service.setWidth(width);
		service.setHeight(height);
		return service;
	}

	public static CaptchaService create() {
		return create(DEFAULT_FONT_SIZE, DEFAULT_WORD_LENGTH, DEFAULT_CHARACTERS, DEFAULT_WIDTH, DEFAULT_HEIGHT);
	}

	// 随机变色处理
	static class ExConfigurableCaptchaService extends ConfigurableCaptchaService {
		private static final Random			RANDOM		= new Random();
		private List<SingleColorFactory>	colorList	= new ArrayList<SingleColorFactory>();	// 为了性能

		public ExConfigurableCaptchaService() {
			colorList.add(new SingleColorFactory(Color.blue));
			colorList.add(new SingleColorFactory(Color.black));
			colorList.add(new SingleColorFactory(Color.red));
			colorList.add(new SingleColorFactory(Color.pink));
			colorList.add(new SingleColorFactory(Color.orange));
			colorList.add(new SingleColorFactory(Color.green));
			colorList.add(new SingleColorFactory(Color.magenta));
			colorList.add(new SingleColorFactory(Color.cyan));
		}

		public ColorFactory nextColorFactory() {
			int index = RANDOM.nextInt(colorList.size());
			return colorList.get(index);
		}

		@Override
		public Captcha getCaptcha() {
			ColorFactory cf = nextColorFactory();
			// CurvesRippleFilterFactory crff = (CurvesRippleFilterFactory) this
			// .getFilterFactory();
			// crff.setColorFactory(cf);

			this.setColorFactory(cf);
			return super.getCaptcha();
		}
	}
}