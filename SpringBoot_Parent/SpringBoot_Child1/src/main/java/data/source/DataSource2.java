package data.source;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;


/**
 * 读取DataSource01数据源<br>
 */
// DataSource01
@Configuration // 注册到springboot容器中
@MapperScan(basePackages = "mapper.remote", sqlSessionFactoryRef = "remoteSqlSessionFactory")
public class DataSource2 {

    /**
     * @methodDesc: 功能描述:(配置test01数据库)
     */
    @Bean(name = "remoteDataSource")
    @ConfigurationProperties(prefix = "spring.datasource.remote")
    public DataSource testDataSource() {
        return DataSourceBuilder.create().build();
    }

    /**
     * @methodDesc: 功能描述:(remote sql会话工厂)
     */
    @Bean(name = "remoteSqlSessionFactory")
    public SqlSessionFactory testSqlSessionFactory(@Qualifier("remoteDataSource") DataSource dataSource)
            throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        // bean.setMapperLocations(
        // new
        // PathMatchingResourcePatternResolver().getResources("classpath:mybatis/mapper/lz/*.xml"));
        return bean.getObject();
    }

    /**
     * @methodDesc: 功能描述:(lz 事物管理)
     */
    @Bean(name = "remoteTransactionManager")
    public DataSourceTransactionManager testTransactionManager(@Qualifier("remoteDataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean(name = "remoteSqlSessionTemplate")
    public SqlSessionTemplate testSqlSessionTemplate(
            @Qualifier("remoteSqlSessionFactory") SqlSessionFactory sqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

}