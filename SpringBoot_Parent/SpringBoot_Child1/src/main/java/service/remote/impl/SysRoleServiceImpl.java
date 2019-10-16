package service.remote.impl;

import entity.remote.SysRole;
import mapper.remote.SysRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.remote.SysRoleService;

@Service
public class SysRoleServiceImpl implements SysRoleService{
    @Autowired
    SysRoleMapper sysRoleMapper;
    @Override
    public void saveSysRole(SysRole sysRole) {
        sysRoleMapper.saveSysRole(sysRole);
    }

    @Override
    public SysRole getSysRoleById(String roleId) {
        SysRole sysRole = sysRoleMapper.getSysRoleById(roleId);
        return sysRole;
    }
}
