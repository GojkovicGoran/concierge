package ba.codecentric.base.repository;

import ba.codecentric.base.domain.Facility;
import ba.codecentric.base.domain.FacilityType;
import org.springframework.data.jpa.repository.JpaRepository;


public interface FacilityTypeRepository extends JpaRepository<FacilityType, Integer> {

    Facility findFirstByOrderById();
}
