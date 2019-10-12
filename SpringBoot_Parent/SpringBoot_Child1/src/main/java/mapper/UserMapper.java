package mapper;
import org.apache.ibatis.annotations.Param;

import entity.User;

public interface UserMapper {
	public void save(@Param("user")User user);
}
