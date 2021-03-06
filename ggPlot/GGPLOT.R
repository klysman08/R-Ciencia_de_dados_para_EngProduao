#---
#title: "GGPLOT2 (3� lista)"
#author: "Klysman Rezende Alves"
#date: "14 de janeiro de 2021"
#output: html_document
---    

## Aula Pacote ggplot2 ##
    
    # Instalação de pacotes

    install.packages('ggplot2')
    install.packages("gapminder")
    require(ggplot2)
    require(gapminder)
    
    # Carrega dados
    
    gapminder <- gapminder
    
    dados_brasil <- subset(gapminder, country == "Brasil", select = -c(country, continent))
    dados_ame <- subset(gapminder, continent == "Americas", select = -continent)
    dados_1952 <- subset(gapminder, year == "1952")
    
    # EXERCICIO A 01 - Gr�fico de pontos da popula��o versus PIB no ano de 1952.
    
    ggplot(dados_1952, aes(x = pop, y = gdpPercap, color = gdpPercap, size = pop)) + 
      geom_point() 
    
    # EXERCICIO A 02 - Gr�fico de pontos da popula��o versus expectativa de vida no ano de 1952.
    
    ggplot(dados_1952, aes(x = pop, y = lifeExp, color = lifeExp, size = pop)) + 
      geom_point()
    
    # EXERCICIO A 03 - Gr�fico de pontos da popula��o em escala log versus a expectativa de vida no ano de 1952.
    
    ggplot(dados_1952, aes(x = pop, y = lifeExp, size = pop)) + 
      geom_point() +
      scale_x_log10() +
      scale_y_log10() 
    
    # EXERCICIO A 04 - Gr�fico de pontos da popula��o em escala log versus a expectativa de vida no ano de 1952, separando os continentes por cor.
   
     ggplot(dados_1952, aes(x = pop, y = lifeExp, color = continent, size = pop)) + 
      geom_point() +
      scale_x_log10() +
      scale_y_log10() 
     
    # EXERCICIO A 05 e 06 - gr�fico de pontos da popula��o em escala log versus a expectativa de vida no ano de 1952, separando os continentes por core o tamanho proporcional ao PIB.
    
      ggplot(dados_1952, aes(x = pop, y = lifeExp, color = continent, size = gdpPercap)) + 
       geom_point() +
       scale_x_log10()   
      
      
    # EXERCICIO A 07 - v�rios gr�ficos de pontos da popula��o em escala log versus a expectativa de vida no ano de 1952, com um gr�fico para cada continente.
      
      ggplot(dados_1952, aes(x = pop, y = lifeExp, color = continent, size = gdpPercap)) + 
        geom_point() +
        scale_x_log10()+
        facet_wrap(~continent)
    
    # EXERCICIO A 08 -  V�rios gr�ficos de pontos do PIB em escala log versus a expectativa de vida, com a cor em fun��o do continente e separando os gr�ficos por ano.
     
       ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) + 
        geom_point() +
        scale_x_log10()+
        facet_wrap(~year)
      
    # EXERCICIO A 09 -  Gr�fico de pontos da mediana do PIB versus a mediana da expectativa de vida no ano de 2007 para os continentes. 
       
       dados_2007 <- subset(gapminder, year == "2007")
       
       mean_lifeExp_year <- aggregate(year ~ lifeExp, data=gapminder, FUN = mean )
       median_lifeExp_year(mean_lifeExp_year$lifeExp)
       
       ggplot(dados_2007, aes(x = median(gdpPercap), y = median(lifeExp), color=continent)) + 
         geom_point() 
         
       ggplot(dados_2007, aes(x=gdpPercap, y=lifeExp, color=continent)) +
         geom_point()
      
       
       df_af_2007 <- subset(dados_2007, continent == "Africa")
       df_as_2007 <- subset(dados_2007, continent == "Asia")
       df_eu_2007 <- subset(dados_2007, continent == "Europe")
       df_am_2007 <- subset(dados_2007, continent == "Americas")
       df_oc_2007 <- subset(dados_2007, continent == "Oceania")
       
       gdp <- c()
       life <- c()
       country <- c("Africa", "Asia", "Europa", "Americas", "Oceania")
       
       gdp <- c(gdp, median(df_af_2007$gdpPercap))
       life <- c(life, median(df_af_2007$lifeExp))
       
       gdp <- c(gdp, median(df_as_2007$gdpPercap))
       life <- c(life, median(df_as_2007$lifeExp))
       
       gdp <- c(gdp, median(df_eu_2007$gdpPercap))
       life <- c(life, median(df_eu_2007$lifeExp))
       
       gdp <- c(gdp, median(df_am_2007$gdpPercap))
       life <- c(life, median(df_am_2007$lifeExp))
       
       gdp <- c(gdp, median(df_oc_2007$gdpPercap))
       life <- c(life, median(df_oc_2007$lifeExp))
       
       gdp
       life
       dados <- data.frame(gdp, life, country)
       
       
       ggplot(dados, aes(x = gdp, y = life, color = country)) + 
         geom_point() 
  
      
       
       # EXERCICIO B 01 -  Plote um gr�fico de linha com a mediana da expectativa de vida a cada ano no mundo (com origem vis�vel).
      
      mean_lifeExp_year <- aggregate(year ~ lifeExp, data=gapminder, FUN = mean )
      median_lifeExp_year <- median(mean_lifeExp_year$lifeExp )
      
      ggplot(median_lifeExp_year, aes(x = year, y = median_lifeExp_year)) + 
         geom_line()
    
       
       # EXERCICIO B 02
       ggplot(gapminder, aes(x = year, y = gdpPercap, select= c(continent), color=continent)) + 
         geom_line()
       
       
       # EXERCICIO B 03
       ggplot(dados_2007, aes(x=year, y=gdpPercap, color=continent)) +
         geom_line()
       
       
  
    
    ggplot(dados_brasil) +
      geom_col(aes(x = year, y = gdpPercap))
    
    ggplot(dados_ame) +
      geom_col(aes(x = year, y = pop)) +
      facet_wrap(~country)
    
    ggplot(dados_ame) +
      geom_histogram(aes(x = lifeExp)) +
      facet_wrap(~country)
    
    ggplot(gapminder) +
      geom_boxplot(aes(x = continent, y = lifeExp)) 
    
    ggplot(gapminder) +
      geom_boxplot(aes(x = year, y = lifeExp, group = year, fill = continent)) +
      facet_wrap(~continent) + 
      ggtitle("Espectativa de vida entre os anos 1952 e 2007 para cada continente") +
      theme(plot.title = element_text(hjust = 0.5))

    
    
    
    #===================================================================================================
    #===================================================================================================
      #                     C�digos de exemplo
    #===================================================================================================

    # 3.3. Função “scale_x_log10” e “scale_y_log10”
    
    ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + 
      geom_point() + 
      scale_x_log10()
    
    ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + 
      geom_point() + 
      scale_y_log10()
    
    ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + 
      geom_point() + 
      scale_x_log10() +
      scale_y_log10()
    
    # 3.4. Parâmetro "aes"
    
    ggplot(gapminder) + 
      geom_point(aes(x = gdpPercap, y = lifeExp, color = continent, size = year)) + 
      scale_y_log10()
    
    # 3.5. Função "facet_wrap()"

      # Dados da América
    
    dados_ame <- subset(gapminder, continent == "Americas")
    
    ggplot(dados_ame) + 
      geom_point(aes(x = gdpPercap, y = lifeExp, color = country, size = lifeExp/gdpPercap)) + 
      facet_wrap(~year)
    
    # 3.6. Função "geom_line()"
    
      # Dados do Brasil
    
    dados_brasil <- subset(gapminder, country == "Brazil")

    ggplot(dados_brasil, aes(x = year, y = lifeExp)) + 
      geom_line()
    
    # 3.7. Função "geom_col()"
    
    ggplot(dados_brasil) + 
      geom_col(aes(x = year, y = gdpPercap, fill = year))
    
    # 3.8. Função "geom_histogram()"
    
    dados_2007 <- subset(gapminder, year == 2007)

    ggplot(dados_2007) + 
      geom_histogram(aes(x = gdpPercap/1000, fill = year), bins = 50)  

    # 3.9. Função "geom_boxplot()"  
    
    ggplot(gapminder) + 
      geom_boxplot(aes(x = continent, y = lifeExp))
    
    ggplot(gapminder, aes(x = year, y = lifeExp)) + 
      geom_boxplot(aes(group = year))
    
    # 3.10. Função "ggtitle()"
    
    ggplot(gapminder, aes(year,lifeExp)) + 
      geom_boxplot(aes(group = year)) + 
      ggtitle("Expectativa de vida entre 1952 e 2007")
    
    # 3.11. Função "geom_abline()"
    
    modelo <- lm(gdpPercap ~ year, data = dados_brasil)
    summary(modelo)
    
    ggplot(dados_brasil, aes(x = year, y = gdpPercap)) +
      geom_point()
    
    ggplot(dados_brasil, aes(x = year, y = gdpPercap)) +
      geom_point() +
      geom_abline(intercept = -251791.91, slope = 130.14, color = "red")
    
    # 3.12. Função "geom_hline()"
    
    ggplot(dados_brasil, aes(x = year, y = lifeExp)) +
      geom_point() +
      geom_hline(yintercept = 60, color = "red")
    
    ggplot(dados_brasil, aes(x = year, y = lifeExp)) +
      geom_point() +
      geom_vline(xintercept = 1975, color = "red")
    
    ggplot(dados_brasil, aes(x = year, y = lifeExp)) +
      geom_point() +
      geom_vline(xintercept = 1975, color = "red") +
      geom_hline(yintercept = 60, color = "red")
    
    # 3.13. Função "geom_smooth()"
    
    ggplot(dados_brasil, aes(x = year, y = gdpPercap)) +
      geom_point() +
      geom_smooth(method = "lm", se = TRUE)
    
    ggplot(dados_ame, aes(x = year, y = gdpPercap)) +
      geom_point() +
      geom_smooth(method = "lm", se = FALSE) +
      facet_wrap(~country)
    
    # 3.14. Função "theme()"
    
    ggplot(dados_brasil) + 
      geom_col(aes(x = year, y = gdpPercap, fill = year)) +
      theme_bw()
    
    ggplot(dados_brasil) + 
      geom_col(aes(x = year, y = gdpPercap, fill = year)) +
      theme_linedraw()
    
    ggplot(dados_brasil) + 
      geom_col(aes(x = year, y = gdpPercap, fill = year)) +
      theme_light()
    
    ggplot(dados_brasil) + 
      geom_col(aes(x = year, y = gdpPercap, fill = year)) +
      theme_dark()
    
    ggplot(dados_brasil) + 
      geom_col(aes(x = year, y = gdpPercap, fill = year)) +
      theme_minimal()
    
    ggplot(dados_brasil) + 
      geom_col(aes(x = year, y = gdpPercap, fill = year)) +
      theme_classic()
    
    ggplot(dados_brasil) + 
      geom_col(aes(x = year, y = gdpPercap, fill = year)) +
      theme_void()
    
    ggplot(dados_brasil) + 
      geom_col(aes(x = year, y = gdpPercap, fill = year)) +
      theme_test()
    
    
    
    
    
    
    
    
        