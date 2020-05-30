package com.furkan.MVC.demo.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource securityDataSource;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(securityDataSource)
		.usersByUsernameQuery("select username, password, enabled from users where username=?")
				.authoritiesByUsernameQuery("SELECT username, role from authorities where username = ?");

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
		.antMatchers("/admin/**").hasRole("ADMIN")
		.antMatchers("/currency").hasAnyRole("ADMIN", "USER")
		.antMatchers("/student/**").hasRole("USER")
		.and()
		.formLogin()
					.loginPage("/")
					.loginProcessingUrl("/authenticateTheUser")
					.defaultSuccessUrl("/")
		.and()
		.logout().logoutSuccessUrl("/")
		.and()
		.exceptionHandling().accessDeniedPage("/access-denied");
	}

}
