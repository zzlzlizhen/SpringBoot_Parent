package service.lz;

import entity.lz.TUser;

public interface TUserService {
    public void savaUser(TUser TUser);
    public TUser getUser(String id);
}
