package br.brpltrade.AOP;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface LogUserActivity {
	String action() default "";

	boolean includeParameters() default false;

	boolean logErrors() default true;
}
