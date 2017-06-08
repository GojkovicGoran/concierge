package ba.codecentric.base.repository;

import ba.codecentric.base.domain.Hotel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface HotelRepository extends JpaRepository<Hotel, Integer> {

    Hotel findFirstByOrderById();

    @Query("SELECT hotel.imageLogo FROM Hotel hotel WHERE hotel.id = ?1")
    String findImagePathById(Integer id);

    boolean existsByName(String name);

}
