package hello.repos;

import hello.domain.Amusement;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AmusementRepository extends JpaRepository<Amusement, Long> {
    Amusement findOneByAmusementId(int id);
    Amusement findOneByDepartment(String department);
}


