package app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.http.HttpMessageConverters;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.scheduling.annotation.EnableAsync;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
/**
 * 以下俩句是扫描controller包
 * @author zsm
 *
 */
//@EnableAutoConfiguration
//@ComponentScan("controller")
/**
 * 默认情况下扫描的是当前包及当前包的子包
 */
@SpringBootApplication(scanBasePackages = {"controller","interceptor","service.*","dao","entity.*","data.source","email","dscontroller.*"})
/**
 *需要单独扫描java mapper 此方法用配置xml的方式引入mapper
 * @author zsm
 */
/*@MapperScan("mapper1")*/
@EnableAsync //开启异步调用
public class SpringApplications{ //extends WebMvcConfigurerAdapter{
	//创建FastJson的消息转换器
	
	public static void main(String[] args) {
		SpringApplication.run(SpringApplications.class, args);
	}

	/*
	 * @Override public void
	 * configureMessageConverters(List<HttpMessageConverter<?>> converters) {
	 * FastJsonHttpMessageConverter converter = new FastJsonHttpMessageConverter();
	 * //创建FastJson配置对象 FastJsonConfig config = new FastJsonConfig();
	 * //格式化FastJson对象 config.setSerializerFeatures(SerializerFeature.PrettyFormat);
	 * 
	 * converter.setFastJsonConfig(config); 
	 * converters.add(converter); }
	 */
	public HttpMessageConverters fastJsonHttpMessageConverter() {
		
			  FastJsonHttpMessageConverter converter = new FastJsonHttpMessageConverter();
			 //创建FastJson配置对象
			  FastJsonConfig config = new FastJsonConfig();
			 //格式化FastJson对象
			  config.setSerializerFeatures(SerializerFeature.PrettyFormat);
			  converter.setFastJsonConfig(config); 
			  HttpMessageConverter<?> con = converter;
			  return new HttpMessageConverters(con);
	}
}

 