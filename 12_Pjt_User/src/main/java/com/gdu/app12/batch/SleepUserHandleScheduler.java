package com.gdu.app12.batch;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@EnableScheduling
public class SleepUserHandleScheduler {
	
	@Scheduled(cron="0 0 1 1/1 * ?")
	public void execute() {
		
		
	}
}
