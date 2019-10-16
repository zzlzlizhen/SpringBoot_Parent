package service.remote;

import entity.remote.SysRole;

public interface SysRoleService {
    public void saveSysRole(SysRole sysRole);
    public SysRole getSysRoleById(String roleId);
}
