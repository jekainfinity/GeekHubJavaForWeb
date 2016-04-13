package com.jekainfinity.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SpringSecConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;

    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {

        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("select username,password,true from USER where username=?")
                .authoritiesByUsernameQuery("select u.username,r.role from USER u, ROLES r," +
                        " USER_ROLE_ID ur where u.username=? and ur.USER_ID=u.USER_ID and r.ROLE_ID=ur.ROLE_ID");
    }


    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.authorizeRequests().antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/user/**").access("hasRole('ROLE_USER')")
                .and().formLogin().loginPage("/login").usernameParameter("j_username")
                .passwordParameter("j_password")
                .and().logout().logoutUrl("/logout").logoutSuccessUrl("/").and().csrf().disable();
    }
}
