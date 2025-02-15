package com.devsuperior.movieflix.configurations;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;

@Configuration
@EnableResourceServer
public class ResourceServerConfig extends ResourceServerConfigurerAdapter{

	@Autowired
	private Environment env;
	
	@Autowired
	private JwtTokenStore tokenStore;
	
	//define os vetores com as rotas pra facilitar nas permissões
	private static final String[] PUBLIC = {"/oauth/token ", "/h2-console/**", "/users/profile"};
//	private static final String [] VISITOR = {"/movies"};
//	private static final String[] ADMIN = {"/users/**"};
	
	//configura o token
	@Override
	public void configure(ResourceServerSecurityConfigurer resources) throws Exception {
		resources.tokenStore(tokenStore);
	}

	//configura as rotas
	@Override
	public void configure(HttpSecurity http) throws Exception {
		
		//config especial pro h2-console
		if (Arrays.asList(env.getActiveProfiles()).contains("test")) {
			http.headers().frameOptions().disable();
		}
		
		http.authorizeRequests()
		.antMatchers(PUBLIC).permitAll() //o que é público tá liberado o resto da aplicação
		.anyRequest().authenticated(); //exige autenticação
	}

	
}