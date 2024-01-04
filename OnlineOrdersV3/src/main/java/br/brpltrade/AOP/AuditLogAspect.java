package br.brpltrade.AOP;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import br.brpltrade.service.AuditLogService;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;

@Aspect
@Component
public class AuditLogAspect {
	private final AuditLogService auditLogService;

	public AuditLogAspect(AuditLogService auditLogService) {
		this.auditLogService = auditLogService;
	}

	@Around("@annotation(logUserActivity)")
	public Object logUserActivity(ProceedingJoinPoint joinPoint, LogUserActivity logUserActivity) throws Throwable {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		String action = logUserActivity.action();
		String details = constructDetails(joinPoint, logUserActivity.includeParameters());

		try {
			Object result = joinPoint.proceed();
			auditLogService.logUserActivity(username, action, details + "\nResult: " + result);

			return result;
		} catch (Throwable throwable) {
			if (logUserActivity.logErrors()) {
				details += "\nError: " + throwable.getMessage();
			}
			throw throwable;
		}
	}

	private String constructDetails(ProceedingJoinPoint joinPoint, boolean includeParameters) {
		StringBuilder detailsBuilder = new StringBuilder();

		if (includeParameters) {
			Object[] args = joinPoint.getArgs();
			String[] parameterNames = ((MethodSignature) joinPoint.getSignature()).getParameterNames();

			for (int i = 0; i < args.length; i++) {
				detailsBuilder.append(parameterNames[i]).append(": ").append(args[i]).append(", ");
			}
		}
		// add adition details here if needed
		detailsBuilder.append("Additional details...");

		return detailsBuilder.toString();
	}
}
