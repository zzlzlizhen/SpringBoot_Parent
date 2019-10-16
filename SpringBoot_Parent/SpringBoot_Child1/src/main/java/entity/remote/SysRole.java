package entity.remote;

import java.util.Date;

public class SysRole {
   

	private Long roleId;
    private String roleName;
    private String remark;
    private Long deptId;
    private Date createTime;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    @Override
   	public String toString() {
   		return "SysRole [roleId=" + roleId + ", roleName=" + roleName + ", remark=" + remark + ", deptId=" + deptId
   				+ ", createTime=" + createTime + "]";
   	} 

}
