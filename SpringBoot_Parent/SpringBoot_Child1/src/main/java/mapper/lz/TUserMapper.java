package mapper.lz;


import entity.lz.TUser;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Qualifier;

@Qualifier("lzSqlSessionFactory")
public interface TUserMapper {
    @Insert("insert into t_user(id,name,pwd,phone,email,create_time,update_time,status) values(#{tUser.id},#{tUser.name},#{tUser.pwd},#{tUser.phone},#{tUser.email},#{tUser.createTime},#{tUser.updateTime},#{tUser.status}) ")
    public void saveUser(@Param("tUser") TUser tUser);
    @Select("select id as id,name as name,pwd as pwd,phone as phone,email as email,create_time as createTime,update_time as updateTime,status as status from t_user where id = #{id}")
    public TUser getUser(@Param("id") String id);
}
