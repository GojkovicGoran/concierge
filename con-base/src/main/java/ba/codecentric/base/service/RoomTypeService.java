package ba.codecentric.base.service;


import ba.codecentric.base.domain.RoomType;
import java.util.List;

public interface RoomTypeService {

    RoomType saveRoomType(RoomType roomType);

    List<RoomType> getAllRoomTypes();

    void deleteRoomType(Integer roomTypeId);

    RoomType findById(Integer roomtypeId);

    String findImagePathById(Integer roomtypeId);

    boolean isExistingName(String name);
}
