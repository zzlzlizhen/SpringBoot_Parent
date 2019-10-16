package service.lz.impl;

import entity.lz.TUser;
import mapper.lz.TUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.lz.TUserService;


@Service
public class TUserServiceImpl implements TUserService {
    @Autowired
    TUserMapper TUserMapper;

    @Override
    public void savaUser(TUser tUser) {
        TUserMapper.saveUser(tUser);
    }

    @Override
    public TUser getUser(String id) {
        TUser TUser = TUserMapper.getUser(id);
        return TUser;
    }
}
