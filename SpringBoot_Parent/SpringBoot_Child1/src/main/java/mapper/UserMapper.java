package mapper;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.User;
import entity.UserExample;

public interface UserMapper {
	public void save(@Param("user")User user);
	public List<User> selectList(@Param("ue") UserExample ue); 
}
