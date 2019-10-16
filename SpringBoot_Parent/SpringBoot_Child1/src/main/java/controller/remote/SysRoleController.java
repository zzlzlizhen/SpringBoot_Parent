package controller.remote;

import entity.remote.SysRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.remote.SysRoleService;

import java.util.Date;

@Controller
public class SysRoleController {
    @Autowired
    SysRoleService sysRoleService;
    @RequestMapping(value = "/saveSysRole")
    @ResponseBody
    public String saveSysRole(){
        SysRole sysRole = new SysRole();
        sysRole.setRoleName("测试");
        sysRole.setRemark("测试");
        sysRole.setCreateTime(new Date());
        sysRole.setDeptId(6l);
        sysRoleService.saveSysRole(sysRole);
        return "ok";
    }
    @RequestMapping(value = "/getSysRole")
    @ResponseBody
    public String getSysRole(String roleId){
        SysRole sysRole = sysRoleService.getSysRoleById(roleId);
        return sysRole.toString();
    }
}
