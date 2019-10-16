package mapper.remote;

import entity.remote.SysRole;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Qualifier;

@Qualifier("remoteSqlSessionFactory")
public interface SysRoleMapper {
    @Insert("insert into sys_role(role_name,remark,dept_id,create_time) values(#{sysRole.roleName},#{sysRole.remark},#{sysRole.deptId},#{sysRole.createTime}) ")
    public void saveSysRole(@Param("sysRole") SysRole sysRole);
    @Select("select role_id as roleId,role_name as roleName,remark as remark,dept_id as deptId,create_time as createTime from sys_role where role_id = #{roleId}")
    public SysRole getSysRoleById(@Param("roleId") String roleId);
}
